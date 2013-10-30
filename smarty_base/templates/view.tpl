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
<div class="full_desc">{$full_desc}</div>
</div>
{/block}
