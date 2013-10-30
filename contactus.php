<?php

require_once 'opensmarty.php';

getads($connection, $smarty);
getsponsors($rootpath,$smarty);


$connection->close();

$smarty->display('contactus.tpl');