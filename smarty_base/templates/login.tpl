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

{if $success != 1}
<div class="entry">
<strong>Login</strong><br />
{if $failed == 1}<strong>Invalid username of password<br /></strong>{/if}
The resource you have requested is restricted. Please login to continue.
<form class="org_formLayout" method="POST" action="userlogin.php">
<label>Username</label><input type="text" name="username" />
<label>Password</label><input type="password" name="password" />
<input type="submit" value="Login" />
</form>
</div>
{else}
<div class="entry">
<strong>You have successfully logged in.</strong>
<a href="/pride">Click here to continue</a>
</div>
{/if}

{/block}
