<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
		<title>Reading Pride - Celebrating diversity within the Thames Valley</title>
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
		<link rel="stylesheet" type="text/css" href="css/forms.css" />
		{block name=headers}{/block}
	</head>
	<body>		
		<div id="logo_container">
			<img id="logo" src="img/logo_office.png" alt="Reading Pride logo" />
			<h1 class="logo">Admin</h1>
		</div>

		<div id="navcontainer">
			<ul class="navbar">
				<li><a href="logout.php">Log Out</a></li>
				<li><a href='/'>Main site</a></li>
				<li><a href="admin.php">Admin</a></li>
				<li><a href="sponsorcpl.php">Sponsors</a></li>
				<li><a href="list.php">Pages</a></li>
			</ul>
		</div>

		<div class="admin_warning">
			<strong>This is the administration area of the Reading Pride website</strong>. Please remember that changes made here are made to the <strong>live</strong> site. <strong>If you are seeing this message, and are not authorised to make changes to the site</strong>, be aware that this is a criminal offence under the Misuse of Computers Act. <strong>If you are authorised to make changes</strong>, welcome and please remember to practice good hygine, and <a href="logout.php">log out</a> when you are finished.
		</div>

		<div class="content">		
			{block name=body}{/block}
		</div>

	</body>
</html>