<?php
if(isset($_GET['url']))
{
	header('Content-type: text/xml');
	$url = $_GET['url'];
	echo file_get_contents("http://".SanitizeString($url));
}

function SanitizeString($var)
{
	$var = strip_tags($var);
	$var = htmlentities($var);
	return stripslashes($var);
}
