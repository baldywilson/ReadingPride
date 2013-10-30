<?php
/* TODO: IMPORTANT! Need to sort out this stupid long_desc full_desc thing 
 * I've seemed to have introduced. Rookie mistake
 */
require_once 'login.php';

$rootpath = $_SERVER['DOCUMENT_ROOT'];
require "$rootpath/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$rootpath/smarty_base/templates";
$smarty->compile_dir  = "$rootpath/smarty_base/templates_c";
$smarty->cache_dir    = "$rootpath/smarty_base/cache";
$smarty->config_dir   = "$rootpath/smarty_base/configs";

$id=-1;
$selector = "";



// If we have an id in he get string, and that id is a valid numeric pattern or
// if we have a category and that category is alphabetic we can continue safely,
// otherwise die.
if(isset($_GET['id']) && preg_match("/^[1-9][0-9]*$/", $_GET['id']))
{
	$id = $_GET['id'];
	$selector = "id";
}

$query = "SELECT url FROM redirect WHERE id='$id'";

$connection = new Connection();
$connection->connect();

$resultset = $connection->query($query);
$rowcount = mysql_num_rows($resultset);

// TODO: Valid 404 death
if($rowcount == 0) die ("404 blah blah");

$results[] = mysql_fetch_array($resultset);

getads($connection, $smarty);
getsponsors($rootpath,$smarty);

$connection->close();

#$smarty->assign('crumb', array( array("name" => "Home", "url" => "index.php"),
																#array("name" => $results[0]['title'], "url" => "view.php?id=" . $_GET['id'])));
$smarty->assign('url', $results[0]['url']);
$smarty->display('redirect.tpl');
