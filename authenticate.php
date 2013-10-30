<?php

session_start();

require_once 'login.php';
$rootpath = $_SERVER['DOCUMENT_ROOT'];
require_once "$rootpath/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$rootpath/smarty_base/templates";
$smarty->compile_dir  = "$rootpath/smarty_base/templates_c";
$smarty->cache_dir    = "$rootpath/smarty_base/cache";
$smarty->config_dir   = "$rootpath/smarty_base/configs";

// Check for an existing session.
$uid = isset($_POST['uid']) ? $_POST['uid'] : $_SESSION['uid'];
$pwd = isset($_POST['pwd'])
? $_POST['pwd'] : $_SESSION['pwd'];

if(!isset($uid))
{
	// No session, ask for login
	unset($_SESSION['uid']);
	unset($_SESSION['pwd']);
	$smarty->assign("auth_redirect", $_SERVER['PHP_SELF']);
	$smarty->display('authenticate.tpl');
	exit;
}

$connection = new Connection();
$connection->connect();

scrub($uid);

$_SESSION['uid'] = $uid;
$_SESSION['pwd'] = $pwd;

// Claimed session. Check it.
$pwd = sha1("^pr!de2O1e" . $pwd);

$query = "SELECT username, pwd FROM users WHERE username='$uid' AND pwd='$pwd'";
$resultset = $connection->query($query);
$rowcount = mysql_num_rows($resultset);
if ($rowcount == 0)
{
	// Invalid session. Clear and redirect to login.
	unset($_SESSION['uid']);
	unset($_SESSION['pwd']);
	$smarty->assign("auth_redirect", $_SERVER['PHP_SELF']);
	$smarty->display('authenticate.tpl');
	exit;
}

