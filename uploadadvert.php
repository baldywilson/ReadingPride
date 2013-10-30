<?php

require_once 'authenticate.php';

// First question is are we responding to an upload request, or are we displaying a form?

$uploaddir = 'img/adverts/';
$tickeruploaddir = 'img/ticker/';

$fileerrors = array();

if(isset($_POST['url']) && isset($_POST['alttext']))
{
	// If we have a url and and alt text, then we are creating a new sponsor
	// TODO: Add mechanism for editing an existing sponsor
	$sponsor_url = $_POST['url'];
	$sponsor_alt = $_POST['alttext'];
	$sponsor_name = $_POST['sponsorname'];

	$sponsor_url = scrub($sponsor_url);
	$sponsor_alt = scrub($sponsor_alt);
	$sponsor_name = scrub($sponsor_name);

	if(empty($sponsor_url) || empty($sponsor_alt) || empty($sponsor_name))
	{
		$sponsor_error = "Both a URL and the alttext <strong>must</strong> be provided for all sponsors";
	}
	else
	{
		// Let's see which files we have
		//
		// This simply loops through the download files array (currently there are four files that can
		// be downloaded) placing the name of the file tag (the id in the form) into $fileid and the
		// file object into $file.
		//
		// If the file has not been uploaded (error is UPLOAD_ERR_NO_FILE) we go on to the next file
		//
		// If there was an error uploading the file (error is not UPLOAD_ERR_OK), then we try to determine
		// what the error was, and store this in an array of errors as xyzzy_error (so gold_file_error for 
		// example), and up the error count.
		//
		// If everything is fine, we up the file count, and place a scrubbed base name into another
		// array to make everything nice and safe for the database.

		$filecount = 0;
		$errorcount = 0;
		foreach($_FILES as $fileid => $file)
		{
			if($file['error'] != UPLOAD_ERR_NO_FILE)
			{
				if($file['error'] != UPLOAD_ERR_OK)
				{
					$erridx = $fileid . "_error";
					$fileErrors[$erridx] = "<strong>Error uploading file</strong> ";
					switch($file['error'])
					{
						case UPLOAD_ERR_INI_SIZE:
						case UPLOAD_ERR_FORM_SIZE:
							$fileErrors[$erridx] .= "The size of the file provided was too large.";
							break;

						case UPLOAD_ERR_PARTIAL:
							$fileErrors[$errIdx] .= "The file was only partially uploaded, please try again. If this problem persists, please contact Claire on <a href='mailto:webmaster.readingpride.co.uk>webmaster.readingpride.co.uk</a>";
							break;

						default:
							$fileErrors[$errIdx] .= "An internal error has occured. Please wait a couple of minuts and try again. If this problem persists,  please contact Claire on <a href='mailto:webmaster.readingpride.co.uk>webmaster.readingpride.co.uk</a>";
							break;
					}
					++$errorcount;
				}
				else
				{
					$filelist[$fileid] = scrub(basename($file['name']));
					++$filecount;
				}

			}

		}

		// If no files have been uploaded, but everything else is fine, we will bail out, because you cannot
		// have a sponsor without a sponsor logo. Report back and slap the user.
		if($filecount == 0 && $errorcount == 0)
		{
			// We cannot add a sponsor with no images.
			$sponsor_error = "No sponsor files have been provided. Every sponsor must have at least one image file";
		}
		else
		{	
			// If there have been any errors uploading files, we will report those errors back and otherwise
			// not continue
			
			if($errorcount != 0)
			{
				$sponsor_error = "One or more errors have occured uploading sponsor images. Please check the error messages below";
			}
			else
			{
				// If we get here, everything is good, so now we can try to move the files out of the temp
				// directory, and into the image directory where they belong
				movefile('gold_file', $uploaddir, $fileErrors['gold_file_error'], $errorcount);
				movefile('silver_file', $uploaddir, $fileErrors['silver_file_error'], $errorcount);
				movefile('bronze_file', $uploaddir, $fileErrors['bronze_file_error'], $errorcount);
				movefile('ticker_file', $tickeruploaddir, $fileErrors['ticker_file_error'], $errorcount);
				if($errorcount == 0)
				{
					// No errors have occured so finally, let's add the sponsor!
					$base_sql = "INSERT INTO adverts SET gotourl='$sponsor_url', alttext='$sponsor_alt', sponsorname='$sponsor_name'";
					if(isset($filelist['gold_file']))
					{
						$sql = $base_sql . ", type=1, imgurl='{$filelist['gold_file']}' ";
						if(!$connection->query($sql)) $errorcount ++;
					}

					if(isset($filelist['silver_file']))
					{
						$sql = $base_sql . ", type=2, imgurl='{$filelist['silver_file']}' ";
						if(!$connection->query($sql)) $errorcount ++;

					}

					if(isset($filelist['bronze_file']))
					{
						$sql = $base_sql . ", type=3, imgurl='{$filelist['bronze_file']}' ";
						if(!$connection->query($sql)) $errorcount ++;
					}
					
					// If you make changes to the code above, DON'T FORGET TO CHECK IT FIRST!
					//
					// The sanity check is here for a reason, so use it. If you make changes to the SQL
					// check it first: put it into a sanity string and uncheck the line below. Cockups
					// on queries are fine. Cockups on INSERTS are not.
					//
					// $smarty->assign("sanity_check", $sanity);

					// We will rely on the template to do what reporting it seems fit. So all we do here is
					// pass the success value over to smarty.
					$success = $errorcount == 0;
					$smarty->assign("post_okay", $success);
				}
				else
				{
					$sponsor_error = "The server could not move one or more images. Please check the information below to identify the problem.";
				}
			}
		}
	}	
}

$smarty->assign("sponsor_error", $sponsor_error);
$smarty->assign("fileErrors", $fileErrors);

$smarty->display('uploadadvert.tpl');

// Tests whether a file for the given index has been uploaded. If it has, attempts
// to move the file to the provided directory using the uploaded file's base name. If
// any errors occur, sets an appropriate error to the provided reference. Returns
// true if a file was uploaded, otherwise returns false.
function movefile($fileidx, $dir, &$err, &$errcount)
{

	if($_FILES[$fileidx]['error'] == UPLOAD_ERR_OK)
	{
		$file = $_FILES[$fileidx];
		if(!move_uploaded_file($file['tmp_name'], $dir . scrub(basename($file['name']))))
		{
			$err = "Failed to move file {$file['name']} to $dir. Please contact Claire on <a href=\"mailto:webmaster@readingpride.co.uk\">webmaster@readingpride.co.uk</a>, providing details of which sponsor you were attempting to add, and which files you were uploading.";
			$errcount ++;
			return false;
		}
	}
}

?>