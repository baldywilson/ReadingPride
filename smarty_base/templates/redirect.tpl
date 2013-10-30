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
<p><h1>Adult Content</h1></p>
<p>&nbsp;</p>

<p><h1 class="col_red">Caution</h1></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>The website you are about to visit contains adult content, and is not suitable for people under 18 years of age.</p>
<p>&nbsp;</p>
<p><a class="css3button" href="/">Return to Reading Pride</a> <a class="css3button" href="{$url}">Continue</a></p>

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
