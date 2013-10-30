<?php

header('Content-type: application/json');

require_once 'login.php';

class advert
{
	public $imgurl;
	public $gotourl;
	public $alttext;
}

if(!isset($_GET['type']) || !preg_match("/^[123]$/", $_GET['type']))
{
	die("Invalid request");
}

$type = $_GET['type'];
$typeidx = $type - 1;		// This may just be a shortfall in my PHPfu

/* NOTE: This may look peculiar, but it is pure coincidence that the type ident
	is the same value as the number of ads displayed for that type. THIS MEANS THIS
	CAN CHANGE. We fear change, and we protect ourselves from it. Please DO NOT
	modify this to "correct" my code. */
$limitarr = array(1, 2, 3);

$connection = new Connection();
$connection->connect();
$q = "SELECT imgurl, gotourl, alttext FROM adverts WHERE type=$type ORDER BY RAND() LIMIT $limitarr[$typeidx]";

$rset = $connection->query($q);

while($row = mysql_fetch_row($rset))
{
	$ad = new advert();
	$ad->imgurl = $row[0];
	$ad->gotourl = $row[1];
	$ad->alttext = $row[2];

	$adverts[] = $ad;
}

$ret = json_encode($adverts);

echo "$ret";
?>

