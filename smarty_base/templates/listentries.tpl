{extends file="admin_base.tpl"}

{block name=headers}

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>


	$(function() {
		$(".full").hide();
		$("tr").click(function() {
			$(this).next(".full").toggle();
		});

		$(".full").click(function(){
			$(this).hide();
		});
	});

</script>

{/block}

{block name=body}

<div class="entry">
<p><a href="edit.php?id=0">Create a new page</a></p>

	<table border="1">
		<tr class="headrow">
			<th>Title</th>
			<th>Description</th>
			<th>Category</th>
			<th>Posted</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
		{foreach $dataRow as $row}
		<tr class="{cycle values="rowdata,rowdataalt"}">
			<td>{$row.title}</td>
			<td>
				{$row.brief_desc|truncate:60:"..."}
			</td>
			<td>{$row.category}</td>
			<td>{$row.postdate}</td>
			<td><a href="view.php?id={$row.id}" target="blank">View</a></td>
			<td><a href="edit.php?id={$row.id}">Edit</a></td>
		</tr>
		<tr class="full long_desc">
			<td colspan="6">{$row.brief_desc}</td>
		</tr>
		{/foreach}
	</table>

</div>

{/block}