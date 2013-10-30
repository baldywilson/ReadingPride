<?php

// class Connection
//
// Used to easily manage a connection to the database. For any given app, change the connection
// details to match the host and database that system is using.
//
// Create a database connection using connect()
// Perform a query using query()
// Close the connection using close()
//
// I have specifically opted not to use a constructor or desctructor until I know whether PHP5
// is current for most hosting solutions
class Connection
{
	protected $db_server;

	# localhost
	protected $db_hostname = 'localhost';
	protected $db_database = 'pride';
	protected $db_username = 'admin';
	protected $db_password = 'jgw1774';

	# outinreading.co.uk/pride
	#protected $db_hostname = 'cust-mysql-123-11';
	#protected $db_database = 'pride';
	#protected $db_username = 'pride';
	#protected $db_password = 'pridedb';
	#protected $db_server;

	# readingpride.co.uk
	// protected $db_hostname = 'localhost';
	// protected $db_database = 'web45-pride';
	// protected $db_username = 'web45-pride';
	// protected $db_password = 'pridedb';

	function connect()
	{
		$this->db_server = mysql_connect($this->db_hostname, $this->db_username, $this->db_password);
		if(!$this->db_server)
		{
			echo ("Unable to connect to MySQL" . mysql_error());
			exit;
		}

		if(!mysql_select_db($this->db_database))
		{
			echo ("Unable to connect to database :" . mysql_error());
			exit;
		}
	}

	function query($query)
	{
		$result = mysql_query($query);
		if(!$result) die ("Database access failed on $query: " . mysql_error());
		return $result;
	}

	function close()
	{
		if($this->db_server)
			mysql_close($this->db_server);
		$this->db_server = false;
	}
}

// scrub
//
// Scrubs a string of anything harmful, making it safe for database operations
function scrub($string)
{
	return htmlentities(mysql_fix_string($string));
}

// Used by scrub DO NOT USE
function mysql_fix_string($string)
{
	if(get_magic_quotes_gpc()) $string = stripslashes($string);
	return mysql_real_escape_string($string);
}

// Returns the hashed password complete with a strong salt
function hashpwd($pwd)
{
	return sha1("a8BhyT$3!" . $pwd . "b4&l08*");
}

// Randomises the adverts to show for each page hit
//
// TODO: This is fugly and rushed, and I need to wonder whether storing ad lists in the database
// is even a good idea, but for now it will do.
function getads($c, $s)
{
	// We need one gold advert
	$query = "SELECT * FROM adverts WHERE type = 1";
	$resultset = $c->query($query);
	$rowid = rand(1, mysql_num_rows($resultset));
	for($skip = 1; $skip < $rowid; ++$skip)
	 	mysql_fetch_array($resultset);

	$row = mysql_fetch_array($resultset);
	$s->assign("ad_gold", $row);

	// Two silver
	for($i = 0; $i < 2; ++$i)
	{
		$query = "SELECT * FROM adverts WHERE type = 2";
		$resultset = $c->query($query);
		$rowid = rand(1, mysql_num_rows($resultset));
		for($skip = 1; $skip < $rowid; ++$skip)
			mysql_fetch_array($resultset);

		$row = mysql_fetch_array($resultset);
		$silver[] = $row;
	}
	$s->assign("ad_silver1", $silver[0]);
	$s->assign("ad_silver2", $silver[1]);

	// Three bronze
	for($i = 0; $i < 3; ++$i)
	{
		$query = "SELECT * FROM adverts WHERE type = 3";
		$resultset = $c->query($query);
		$rowid = rand(1, mysql_num_rows($resultset));
		for($skip = 1; $skip < $rowid; ++$skip)
			mysql_fetch_array($resultset);

		$row = mysql_fetch_array($resultset);
		$bronze[] = $row;
	}
	$s->assign("ad_bronze1", $bronze[0]);
	$s->assign("ad_bronze2", $bronze[1]);
	$s->assign("ad_bronze3", $bronze[2]);
}

class ImageIterator extends FilterIterator
{
	public function accept()
	{
		return preg_match('@\.(gif|jpe?g|png)$@i', $this->current());
	}
}

function getsponsors($root, $s)
{
	foreach (new ImageIterator(new DirectoryIterator("$root/img/ticker")) as $file)
	{
		$images[] = $file->getFilename();
	}
	shuffle($images);
	$s->assign("sponsors", $images);
}

error_reporting(E_ERROR);

$rootpath = $_SERVER['DOCUMENT_ROOT'];
require "$rootpath/Smarty/Smarty.class.php";

$smarty = new Smarty();
$smarty->template_dir = "$rootpath/smarty_base/templates";
$smarty->compile_dir  = "$rootpath/smarty_base/templates_c";
$smarty->cache_dir    = "$rootpath/smarty_base/cache";
$smarty->config_dir   = "$rootpath/smarty_base/configs";

$connection = new Connection();
$connection->connect();