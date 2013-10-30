<?php
//
// userlogin.php
//
// Handles the user login. Any page that requires an active session should check the session then redirect
// here if the session is not present, or is invalid.
//

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

if(isset($_POST['username']) && isset($_POST['password']))
{
	// User is attempting to login, verify the credentials
	$pwd = hashpwd($_POST['password']);
	$uname = scrub($_POST['username']);

$query = <<<_QUERY

	SELECT idusers FROM users WHERE username='$uname' AND pwd='$pwd'
_QUERY;

	$results = $connection->query($query);
	$rowcount = mysql_num_rows($results);
	if($rowcount == 1)
	{
		$uid_row = mysql_fetch_array($results);
		$uid = $uid_row['idusers'];
		// Open session
		session_start();
		$sessionid = md5("s3ssionsalt" . uniqid('', true));
		$_SESSION['claimedid'] = md5("s3ssionsalt" . $uid);
		$_SESSION['sessionid'] = $sessionid;
		$query = "UPDATE users SET sessionid = '$sesionid' WHERE idusers = $uid";
		if(!$connection->query($query)) die ("Unable to create session");
		// Have to work around a little header bug here.
		$smarty->assign('success', 1);
	}
	else 
	{
		$smarty->assign('failed', 1);
	}
}

$smarty->display('login.tpl');
