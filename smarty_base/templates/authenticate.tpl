{extends file="admin_base.tpl"}

{block name=headers}
{literal}
<link rel="stylesheet" type="text/css" href="css/forms.css" />
<style type="text/css">
.nextButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:1px 1px 0px #ffffff;
}.nextButton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}.nextButton:active {
	position:relative;
	top:1px;
}
/* This imageless css button was generated by CSSButtonGenerator.com */
</style>
{/literal}
{/block}

{block name=body}
<div class="entry">

	<form action"{$auth_redirect}" method="post">
		<h2>Log in</h2>
		<div class="warning">
			Access to the page you have requested is restricted. To proceed, please enter your login
			credentials in the form below.
		</div>
		<div style="margin-top: 20px;"><label>Username</label><input type="text" name="uid" /></div>
		<div><label>Password</label><input type="password" name="pwd" /></div>
		<div><input type="submit" value="Log in"</div>
	</form>
</div>

{/block}