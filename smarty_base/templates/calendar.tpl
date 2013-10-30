{extends file="base.tpl"}

{block name=navbar}

<div id="navwrapper">
<div class="month"><a href="index.php?month={$prev_month}&year={$year}&view={$view}">&lt; {$prev_monthname}</a></div>
<div class="month"><a href="index.php?month={$month}&year={$year}&view={$view}">{$monthname}</a></div>
<div class="month"><a href="index.php?month={$next_month}&year={$year}&view={$view}">{$next_monthname} &gt;</a></div>
<div class="month"><a href="index.php?month={$month}&year={$year}&view={$altview}">View</a></div>
</div>

{/block}

{block name=body}
<div id="calendar">
<!-- Titles -->
<div class="entry">1</div>
<div class="entry">2</div>
<div class="entry">3</div>
<div class="entry">4</div>
<div class="entry">5</div>
<div class="entry">6</div>
<div class="entry">7</div>
<div class="entry">8</div>
<div class="entry">9</div>
<div class="entry">10</div>
<div class="entry">11</div>
<div class="entry">12</div>
<div class="entry">13</div>
<div class="entry">14</div>
</div>
{/block}

