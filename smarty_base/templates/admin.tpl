{extends file="admin_base.tpl"}

{block name=headers}
<link rel="stylesheet" type="text/css" href="css/control_panel.css" />
{/block}

{block name=body}


<div class="cpanel">
<h2>Control panel</h2>
<p>
This is the main administration control panel. As more administrative facilities are added, more options
will be provided here. At the moment we only have the sponsor control panel, which allows you to add sponsors. All administrators will be notified as features are added.
</p>
<p>If there are features that you would like added, please let <a href="mailto:claire.wilson@readingpride.co.uk">Claire know!</a></p>
<div class="warning">
	In the interests of the security and stability of the Reading Pride site, please remember to <a href="logout.php">log out</a> of the administration area when you are finished!
</div>


<ul>
	<li><a href="sponsorcpl.php">Sponsorship control panel</a></li>
	<li><a href="list.php">Web pages control panel</a></li>
</ul>
</div>

{/block}
