{extends file="base.tpl"}

{block name=headers}
{literal}
{/literal}
{/block}

{block name=navbar}

<div id="navwrapper">
{section name=row loop=$crumb}
<div class="month">
<a href="{$crumb[row].url}">{$crumb[row].name}</a>
</div>
{/section}
</div>

{/block}

{block name=body}
<div class="entry">
<p><a href="edit.php?id=0">Create a new page</a></p>
<table>
{section name=row loop=$record}
<tr>
	<th><a href="view.php?id={$record[row].id}">{$record[row].id}</a></th>
	<td><a href="edit.php?id={$record[row].id}">Edit</a></td>
	<td>{$record[row].title}</td>
	<td>{$record[row].category}</td>
</tr>
{/section}
</table>
</div>
{/block}
