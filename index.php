<?php


//
// index.php
//
// The main landing page for the site. Here we're only concerned with
// displaying events for the selected month / year which will be passed
// in the uri as &month=xx &year=yy if either one is not provided, values
//
// from the current date will be assumed (e.g. index.php&year=2014 will return
// entries for the current month in the year 2014 index.php&month=3 will return
// entries for the current year March and index.php&month=4&year=2014 will return
// entries for April 2014

require_once 'login.php';


$rootpath = $_SERVER['DOCUMENT_ROOT'];
require "$rootpath/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$rootpath/smarty_base/templates";
$smarty->compile_dir  = "$rootpath/smarty_base/templates_c";
$smarty->cache_dir    = "$rootpath/smarty_base/cache";
$smarty->config_dir   = "$rootpath/smarty_base/configs";
	 

//
// Grab the pages from the header table
//
$connection = new Connection();
$connection->connect();

$query = <<<_QUERY
SELECT pages.id as pageid,
       pages.title as title,
       pages.brief_desc as brief_desc,
	   pages.full_desc as full_desc,
       header.pos as idx,
       pages.headercol as color
FROM pages INNER JOIN header ON pages.id = header.page_id
ORDER BY idx
_QUERY;

$resultset = $connection->query($query);
$rows = mysql_num_rows($resultset);
$headers = array();
for($i = 0; $i < $rows; ++$i)
{
	$results[] = mysql_fetch_array($resultset);
}


// Index template also displays the slideshow, so we need to get all the images in
// the festival list, and give that to the template. Please note that currently images
// MUST be 724 x 420

foreach(new DirectoryIterator("$rootpath/img/festival") as $file)
{
	if($file->isFile()) 
		$galleryimg[] = $file->getFilename();
}

// Let's make the images appear in completely random order
shuffle($galleryimg);
$smarty->assign("galleryimg", $galleryimg);

// Get ads
getads($connection, $smarty);
getsponsors($rootpath,$smarty);

$connection->close();

$smarty->assign('results', $results);

$smarty->assign('crumb', array( array("name" => "Home", "url" => "index.php")));
$smarty->display('index.tpl');

?>
