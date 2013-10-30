{extends file="base.tpl"}

{block name=headers}
<link rel="stylesheet" type="text/css" href="css/forms.css" />
<style>

form {
	padding-left: 10px;
	padding-right: 10px;
}

form div {
	margin-bottom: 10px;
}

form em {
	text-decoration: none;
	font-weight: bold;
}

</style>
{/block}

{block name=navbar}

<div id="navwrapper">

{section name=row loop=$crumb}
<div class="month"><a href="{$crumb[row].url}">{$crumb[row].name}</a></div>
{/section}
</div>


{/block}

{block name=body}

<div class="entry">
	
	<h1>Check your logo</h1>

	<p>
		We know that there is nothing more frustrating than having your ipsum lorem etc
	</p>

	{if $validated eq 'true'}
	<p>Image size is <b>Correct</b></p>
	{elseif $validated eq 'false'}
	<p>Image size in <b>Not</b> the correct size</p>
	{/if}


	<form action="checkyourad.php" method="post" enctype="multipart/form-data">
	<p>
		The Reading Pride website has four types of adverts, and we require those adverts to
		be provided specific dimensions. These are:
		<ul>
			<li><em>Gold</em> 468 pixels wide, by 60 pixels tall</li>
			<li><em>Silver</em> 60 pixels wide, by 160 pixels tall</li>
			<li><em>Bronze</em> 234 pixels wide, by 60 pixels tall</li>
		</ul>
		We also run a rolling ticker containing our sponsors logos, the images for the ticker
		need to be <em>150 pixels wide, by 50 pixels tall</em>. Ideally we would prefer ticker
		images to be a .png file with a transparent background
	</p>

		<div>
			<label>Logo size</label>
			<select name="size">
				<option value="1"> Gold - 468 x 60 pixels</option>
				<option value="2"> Silver - 60 x 160 pixels</option>
				<option value="3"> Bronze - 234 x 60 pixels</option>
				<option value="4"> Ticker - 150 x 50 pixels</option>
			</select>
		</div>
		<div>
			<label>Select file to check</label>
			<input type="file" name="checkfile" id="checkfile" />
		</div>

	</form>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>

</div>

{/block}