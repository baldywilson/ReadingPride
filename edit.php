<?php

// For editting article text.
//
// Users must be authenticated which is why we do minimal checks
// on input. I will be removing the 'color' entry from the entire
// system as it didn't end up getting used in the way I'd originally
// planned so it's now completely redundant.

require_once 'authenticate.php';

$pageid = 0;
$title = "";
$short_desc = "";
$long_desc = "";
$category = "";
$color = "";

$getid = -1;		// Someone has come here to create a new article, and just wants to see the page

//
// Grab the pages from the header table
//

if(isset($_POST['pageid']))
{
	// If we are POSTing, we are updating the table
	$pageid = $_POST['pageid'];
	$short_desc = mysql_real_escape_string($_POST['short_desc']);
	$long_desc = mysql_real_escape_string($_POST['long_desc']);
	$title = mysql_real_escape_string($_POST['title']);
	$category = mysql_real_escape_string($_POST['category']);
	$color = mysql_real_escape_string($_POST['color']);

	if($pageid != 0)
	{
		$query = <<<_QUERY
UPDATE pages SET title='${title}', brief_desc='$short_desc', full_desc='$long_desc', category='$category', headercol ='$color' WHERE id=$pageid
_QUERY;
		$resultset = $connection->query($query);
		$getid = $pageid;
	}
	else
	{
		$query = <<<_QUERY
INSERT INTO pages SET title='${title}', brief_desc='$short_desc', full_desc='$long_desc', category='$category', headercol ='$color'
_QUERY;
//echo $query; exit;
		$resultset = $connection->query($query);
		$getid = mysql_insert_id();
	}
}

if(isset($_GET['id']))
{
	$getid = $_GET['id'];
}

if($getid > 0)
{
	$query = "SELECT id, title, brief_desc, full_desc, category, headercol FROM pages WHERE id=$getid";
	$resultset = $connection->query($query);
	$rowcount = mysql_num_rows($resultset);
	if($rowcount > 0)
	{
		$row[] = mysql_fetch_array($resultset);

		$pageid = $row[0]['id'];
		$title = $row[0]['title'];
		$short_desc = $row[0]['brief_desc'];
		$long_desc = $row[0]['full_desc'];
		$category = $row[0]['category'];
		$color = $row[0]['headercol'];
	}
	else
	{
		$short_desc = 'Error';
		$long_desc = "No entry found for id $getid";
	}
}



$smarty->assign('pageid', $pageid);
$smarty->assign('title', $title);
$smarty->assign('short_desc', $short_desc);
$smarty->assign('long_desc', $long_desc);
$smarty->assign('category', $category);
$smarty->assign('color', $color);
$smarty->display('edit.tpl');

?>
