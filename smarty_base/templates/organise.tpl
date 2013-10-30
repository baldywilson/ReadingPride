{extends file="base.tpl"}

{block name=headers}

<!-- just testing -->

{/block}

{block name=navbar}
<div id="navwrapper">
<div class="month"><a href="/2013">Home</a></div>
</div>
{/block}

{block name=body}

{if $display eq 'all' or $display eq 'login'}
<div class="entry">
<p><b>If you are a registered organiser</b>, please login to edit your events</p>
<form class="org_formLayout" method="POST" action="organise.php">
<label>Username</label><input type="text" name="username">
<label>Password</label><input type="password" name="password"> <input type="submit" value="Login" />
</form>

</div>
{/if}

{if $display eq 'all' or $display eq 'register'}
<div class="entry">
<p><b>If you are not a registered events organiser</b>, you can still list your event. If you intend to
regularly list events, why not consider becoming a registered organiser, by filling out the registration form
below?</p>
<form class="org_formLayout" method="POST" action="organise.php">
<label>e-mail address</label><input type="text" name="username" />
<label>Select a password</label><input type="password" name="password" /> 
<label>Re-enter password</label><input type="password" name="confirmPassword" />
<label>Organisation name</label><input type="text" name="orgname" />
<label>Principle contact</label><input type="text" name="contactname" />
<label>Contact telephone</label><input type="text" name="contacttel" />
<input type="submit" value="Register" />
</form>
</div>
{/if}

{if $display eq 'all' or $display eq 'once'}
<div class="entry">
<p><b>If you do not wish to register</b>, you can still list your event. Simply <a href="organise.php?show=listsingleevent"> click here to provide us with your event details</a> . All
events submitted through this form are <a href="organise.php?show=vetting">vetted for suitability</a>, but we aim to have all events listed within XX days. 
We will send you an email just as soon as your event is listed.</p>
<p>To learn more about or vetting process and why we need to do this, please <a href="organise.php?show=vetting">click here</a></p>
</div>
{/if}


{/block}
