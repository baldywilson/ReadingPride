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
<div class="full_desc">
<h1>Contact us</h1>
<p>If you can’t find the information you need on our website, or if you have a specific question for one of our teams, please contact us by phone, email or post. </p>
<h2>Telephone enquiries</h2>
<p>If you have a telephone enquiry, please call <strong>0844 357 0124</strong></p>
<h2>General Enquiries</h2>
<p>For all general enquiries, please email <a href="mailto:info@readingpride.co.uk">info@readingpride.co.uk</a></p>

<h2>Write to us</h2>
<p> If you need to write to us, send your letter to:</p>
<p>
Reading Pride<br>
PO Box 8106<br>
Reading<br>
Berkshire<br>
RG30 9FA<br>
</p>
<p>&nbsp;</p><p>&nbsp;</p>
</div>
</div>
{/block}