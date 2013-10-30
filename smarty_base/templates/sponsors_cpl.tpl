{extends file="admin_base.tpl"}

{block name=headers}
<link rel="stylesheet" type="text/css" href="css/control_panel.css" />
{/block}

{block name=body}


<div class="cpanel">
<h2>Sponsors</h2>
<p>
This is the control panel for managing sponsors. At the moment, there is the facility to add
a new sponsor to the main ticker page, which also provides the facility to upload the various banner
adverts, and add an image to the ticker tape on the main site.
</p>
<p>Adding facilities such as reviewing which sponsors we have on the system may well be added at a later date, together with adding facilities to amend the sponsor images. Please bear in mind however that such facilities are currently being considered a <strong>low priority</priority>.
<p>If there are features that you would like added, please let <a href="mailto:claire.wilson@readingpride.co.uk">Claire know!</a></p>
<div class="warning">
	In the interests of the security and stability of the Reading Pride site, please remember to <a href="logout.php">log out</a> of the administration area when you are finished!
</div>
<ul>
	<li><a href="listsponsors.php">List all sponsors</a></li>
	<li><a href="uploadadvert.php">Add new sponsor</a></li>
</ul>
</div>

{/block}
