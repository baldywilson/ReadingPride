<?php

// list.php
//
// Provides a list of all articles in the database, together with their link ids
// to allow easy editting. This will become subject to session management

require_once 'authenticate.php';

$query = "select idadverts as id, sponsorname, imgurl, gotourl, typename from adverts as t1 inner join advert_types as t2 on t1.type=t2.typeid";

$resultset = $connection->query($query);
while($records[] = mysql_fetch_array($resultset)) ;
array_pop($records);


$smarty->assign("dataRow", $records);
$smarty->display('listsponsors.tpl');
