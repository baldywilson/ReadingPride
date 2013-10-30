<?php

//
// get_eventdesc.php
//
// Given an event_id as a post, returns markup describing the event.
// TODO: Currently this is doing the markup, which is a Bad Thing(tm)
// Really want this to be returning XML, and have jQuery sort out
// the markup. Separation of roles and all that
//

if(!isset($_GET['id']) || !preg_match("/^[0-9]+$/", $_GET['id']))
{
	// As this won't be coming from our script, let's just provide 
	// basic information.
	die ("Invalid id, or id not supplied ($id)");
}

$id = $_GET['id'];

// Only now do we spend the resources to access the database.
require_once 'login.php';
$connection = new Connection();
$connection->connect();

$query = <<<_QUERY

SELECT events.full_desc AS description FROM events WHERE events.id=$id

_QUERY;

$resultset = $connection->query($query);

// If we have nothing, something has gone wrong, or someone is deliberately attempting
// to mine the database - which is a very silly thing to do.
//
// QUESTION: Do we want to protect the form to prevent random people sending queries,
// even if only with a simple referer test? My initial thought is that this is too 
// burdensome for little good.

if(mysql_num_rows($resultset) != 1)
{
	echo "Sorry, something appears to have gone wrong. We cannot find any information about this even";
	exit;
}

// If we're here, we have exactly one row, so just return that for now. We'll spruce
// this up later.
//
// TODO: Clean this up. Get rid of the "RESULT" which we're only using for testing 
// purposes so we know *something* has been returned.

$row[] = mysql_fetch_array($resultset);
$description = $row[0]['description'];
if($description == '')
	echo "Sorry, no further information is available on this event. If you need more information, please contact the organiser";
else
	echo $row[0]['description'];



?>
