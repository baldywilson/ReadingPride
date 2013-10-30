<?php

// list.php
//
// Provides a list of all articles in the database, together with their link ids
// to allow easy editting. This will become subject to session management

require_once 'authenticate.php';

$query = "SELECT id, title, brief_desc, category, postdate FROM pages";

$resultset = $connection->query($query);
while($records[] = mysql_fetch_array($resultset)){
	$records[count($records)-1]->brief_desc = strip_tags($records[count($records)-1]->brief_desc);
	
}

$smarty->assign("dataRow", $records);
$smarty->display('listentries.tpl');
