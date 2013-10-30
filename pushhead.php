<?php

// Pushes a new headline article onto the main site
//
// This is not currently linked to from anywhere, so pushing
// a headline requires manually going to pushhead.php?id={article_id}
// This will put that article as the *second* article in the list


require_once 'authenticate.php';

$id = 0;

if(!(isset($_GET['id']) && preg_match("/^[0-9]*$/", $_GET['id'])))
{
	header("HTTP/1.0 400 Bad Request");
	exit;
}

$pushid = $_GET['id'];
$r1 = $connection->query("SELECT page_id FROM header ORDER BY pos");
$rowcount = mysql_num_rows($resultset);

for($i = 5; $i > 1; $i--)
{
	$rows[$i]['page_id'] = $rows[$i-1]['page_id'];
}

$rows[1]['page_id'] = $pushid;

for($i = 2; $i < 7; $i++)
{
	$pid = $rows[$i-1]['page_id'];
	$connection->query("UPDATE header SET page_id=$pid WHERE pos=$i");
//	echo "UPDATE header SET page_id=$pid WHERE pos=$i<BR>";
}

header('Location: index.php');