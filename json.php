<?php

if(isset($_GET['value']))
{
	$tpwd = $_GET['value'];
}
else
{
	$tpwd = strtoupper(substr(sha1(time()), 0, 4) . " " . substr(md5(time()), 4, 4));
}

$hash = sha1("^pr!de2O1e" . $tpwd);
echo "Temporary password is [$tpwd]<br>";
echo "SHA1 of string with salt ^pr!de2O1e is [$hash]<br>";

$formid = md5(uniqid(mt_rand(), true));
echo "Form Id $formid<br>";

?>