<?php

// INCOMPLETE, NOT ON WEBSITE
//
// The intent here is to allow people to check the dimensions of
// an ad before uploading it. Never really got around to finishing this

require_once 'login.php';

$rootpath = $_SERVER['DOCUMENT_ROOT'];
require "$rootpath/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$rootpath/smarty_base/templates";
$smarty->compile_dir  = "$rootpath/smarty_base/templates_c";
$smarty->cache_dir    = "$rootpath/smarty_base/cache";
$smarty->config_dir   = "$rootpath/smarty_base/configs";

$connection = new Connection();
$connection->connect();

getads($connection, $smarty);
getsponsors($rootpath,$smarty);

$connection->close();

$smarty->display('checkyourad.tpl');