{extends file="admin_base.tpl"}

{block name=headers}

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/lightbox/js/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css" href="js/lightbox/css/jquery.lightbox-0.5.css" media="screen" />

<script>

	$(function(){
		$("#gallery a.imgurl").lightBox();
	});

</script>

{/block}

{block name=body}

<div class="entry">


	<table border="1" id="gallery">
		<tr class="headrow">
			<th>Name</th>
			<th>Type</th>
			<th>Image</th>
			<th>Link</th>

		</tr>
		{foreach $dataRow as $row}
		<tr class="{cycle values="rowdata,rowdataalt"}">
			<td>{$row.sponsorname}</td>
			<td>{$row.typename}</td>
			<td><a class="imgurl" href="img/adverts/{$row.imgurl}" title="{$row.sponsorname} - {$row.typename} advert">Preview</a></td>
			<td><a href="{$row.gotourl}" target="_blank">{$row.gotourl}</a></td>
		</tr>
		{/foreach}
	</table>

</div>

{/block}