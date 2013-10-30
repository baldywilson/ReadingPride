{extends file="admin_base.tpl"}

{block name=headers}
{literal}
<script src="ckeditor/ckeditor.js"></script>
<!-- <script>

	$(function(){
		CKEDITOR.replace( '#long_desc', {
		config.contentsCss: '/css/layout.css',
		extraPlugins: 'stylesheetparser'

	});
	});

});</script>-->
{/literal}
{/block}

{block name=body}

<form action="edit.php?id={$pageid}" method="post">
<input name="pageid" type="hidden" value="{$pageid}" />
Title<br /><input type="text" name="title" value="{$title}" /><br />
Short desc <br /><textarea name="short_desc" rows="10" cols="88">{$short_desc}</textarea><br />
Long desc <br /><textarea id="long_desc" rows="25" cols="88" name="long_desc">{$long_desc}</textarea><br />
Category<br /><input type="text" name="category" value="{$category}" /><br />
Colour<br /><input type="text" name="color" value="{$color}" /><br />
<input type="Submit" />

</form>
<p><a href="list.php">Back to listing</a></p>

{/block}
 