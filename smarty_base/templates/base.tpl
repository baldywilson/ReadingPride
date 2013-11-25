<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
		<title>Reading Pride - Celebrating diversity within the Thames Valley</title>
		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		
		{*
			This part deals with the Google Analytics code. Please do not change unless you
			really know what you're doing.
		*}
		<!-- Google analytics code -->
		<script type="text/javascript">

			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-39948816-1']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();

		</script>
		<!-- End Google analytics code -->

		{* 
			Bring in the jquery and jquery slides java script 
		*}
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="js/rcarousel/widget/lib/jquery.ui.widget.js"></script>
		<script src="js/rcarousel/widget/lib/jquery.ui.rcarousel.js"></script>
		<link type="text/css" rel="stylesheet" href="js/rcarousel/widget/css/rcarousel.css" />

		{*
			handles the layout of the sponsor carousel. TODO: need to move this into the stylesheet
		*}
		<style>
			#carousel {
				width: 600px;
				margin-top: 10px; 
				float: left;
			}
		</style>

		
		{*
			This part handles the carousel for the sponsor logos, and the AJAX stuff for managing
			changing the ads
		*}

		{literal}
		<script>

			var intervalOffsetId;

			jQuery(function($) {
				$("#carousel").rcarousel({
					auto: {enabled: true},
					height: 40,
					margin: 10,
					speed: 750,
					visible: 4,
					step: 4
				});

				intervalOffsetId = setInterval(beginOffset, 90000);
			});

			setInterval(function() {

				$.ajax({
					type: 'GET',
					url: 'nextsponsor.php?type=2',
					dataType: 'json',
					success: function(data, status) {
						var ladhtml = '<a href="' + data[0].gotourl + '""><img src="img/adverts/' + data[0].imgurl + '" alt="' + data[0].alttext + '" /></a>';
						var radhtml = '<a href="' + data[1].gotourl + '""><img src="img/adverts/' + data[1].imgurl + '" alt="' + data[1].alttext + '" /></a>';

						$("#leftad").html(ladhtml);
						$("#rightad").html(radhtml);
					}

				});
			}, 60000);

			function beginOffset()
			{
				setInterval(runBronze, 60000);
				clearInterval(intervalOffsetId);
			}

			function runBronze() {
				$.ajax({
					type: 'GET',
					url: 'nextsponsor.php?type=3',
					dataType: 'json',
					success: function(data, status) {

						// alert(data[1].alttext);
						var b1 = '<a href="' + data[0].gotourl + '""><img src="img/adverts/' + data[0].imgurl + '" alt="' + data[0].alttext + '" /></a>';
						var b2 = '<a href="' + data[1].gotourl + '""><img src="img/adverts/' + data[1].imgurl + '" alt="' + data[1].alttext + '" /></a>';
						var b3 = '<a href="' + data[2].gotourl + '""><img src="img/adverts/' + data[2].imgurl + '" alt="' + data[2].alttext + '" /></a>';
						
						$("#bronze1").html(b1);
						$("#bronze2").html(b2);
						$("#bronze3").html(b3);
					}

				});
			}

		</script>
		{/literal}

		{block name=headers}
		{/block}
	</head>
	<body>
		<div id="pagewrap">
		<div id="main_navbar_wrapper" class="col_bdr_red">
			<div id="main_navbar">
				<ul class="navbar_1">
					<li><a class="col_red_hover" href=".">Home</a></li>
					{* <li><a class="col_orange_hover" href="view.php?category=parade">Parade</a></li> *}
					{* <li><a class="col_yellow_hover" href="view.php?category=festival">Festival</a></li> *}
					<li><a class="col_green_hover" href="view.php?category=about">About Us</a></li>
					<li><a class="col_blue_hover" href="view.php?category=getinvolved">Get Involved</a></li>
					<li><a class="col_red_hover" href="view.php?category=market">Market</a></li>
					{* <li><a class="col_orange_hover" href="view.php?category=events">Events</a></li> *}
					<li><a class="col_yellow_hover" href="contactus.php">Contact Us</a></li>
					{* <li><a class="col_green_hover" href="view.php?category=gettingthere">Travel</a></li> *}
					<!-- <li><a href="view.php?category=community">Community</a></li> -->
					<!-- <li><a href="view.php?category=media">Media</a></li> -->
					<!-- <li><a href="view.php?category=contact">Contact</a></li> -->
				</ul>
				<ul class="navbar_right">
					<li class="noborder"><a href="http://www.youtube.com/readingprideoffical"><img src="img/youtube_32.png" alt="Facebook" /></a></li>
					<li class="noborder"><a href="http://www.flickr.com/photos/59467464@N07/"><img src="img/flickr_32.png" alt="Flickr" /></a></li>
					<li class="noborder"><a href="http://www.facebook.com/ReadingPrideUK"><img src="img/facebook_32.png" alt="Facebook" /></a></li>
					<li><a href="https://twitter.com/Reading_Pride"><img src="img/twitter_32.png" alt="Twitter" /></a></li>
					
					
					
				</ul>

			</div>

		</div>
		<div id="header">

			<div style="float: left"><img id="logo" src="img/logo_office.png" alt="Reading Pride logo"></div>
			<div id="byline">
				30<sup>th</sup> August 2014
				<div class="small">King&#8217;s Meadow Park, Reading<br />Berkshire, RG1 8BN<br /><strong>Free</strong> festival for all</div>
			</div>
			<div id="tagline">Encouraging integration, equality and diversity within the Thames Valley</div>
			<div id="header_advert">
				<div>
					<!-- <img src="/2013/img/x_468x60_gold.gif" /> -->
					<a href="{$ad_gold.gotourl}" target="_blank">
					<img src="img/adverts/{$ad_gold.imgurl}" alt="{$ad_gold.alttext}" />
					</a>
				</div>
				<div id="carousel">
					{section name=sponsor loop=$sponsors}
					<img src="img/ticker/{$sponsors[sponsor]}" height="50" />
					{/section}
				</div>
			</div>
		</div>
 			
		<div id="nav">
		<!-- 	{block name=navbar}{/block} -->
		</div>


		<div id="contentwrap">
			<div id="main_enclose">
			<div id="main">
			{block name=body}
			{/block}
		<div class="entry" style="margin: 0px; padding:0px">
		<div style="margin: auto; text-align: center">
		<span id="bronze1"> <a href="{$ad_bronze1.gotourl}"><img src="img/adverts/{$ad_bronze1.imgurl}" alt="{$ad_bronze1.alttext}"></a></span>
		<span id="bronze2"> <a href="{$ad_bronze2.gotourl}"><img src="img/adverts/{$ad_bronze2.imgurl}" alt="{$ad_bronze2.alttext}"></a></span>
		<span id="bronze3"> <a href="{$ad_bronze3.gotourl}"><img src="img/adverts/{$ad_bronze3.imgurl}" alt="{$ad_bronze3.alttext}"></a></span>
		</div>
			<!--<div class="bronzead"><img src="img/bronze.gif" /></div>
			<div class="bronzead"><img src="img/bronze.gif" /></div>
			<div class="bronzead"><img src="img/bronze.gif" /></div>-->
		</div>
			</div>
			<div id="leftad" class="silverad">
				<a href="{$ad_silver1.gotourl}">
				<img src="img/adverts/{$ad_silver1.imgurl}" alt="{$ad_silver1.alttext}" />
				</a>
			</div>
			</div>
			<div id="rightad" class="silverad">
				<a href="{$ad_silver2.gotourl}">
				<img src="img/adverts/{$ad_silver2.imgurl}" alt="{$ad_silver2.alttext}" />
				</a>
			</div>
		</div>

		<div id="footer">Copyright (c) Reading Pride.<br />
<p>Reading Pride is a trading name of Reading Pride Limited, a company registered in England and Wales (Registered Number: 05041291) and a registered charity (Registered Number: 1119891).</p>
<p>All images on main page Copyright (c) 2012, Lynda Bowyer Photography. Images elsewhere are copyright (c) Lynda Bowyer or copyright (c) Fran Light</p>
		</div>
		
		
		</div> <!-- pagewrap -->
	</body>
</html>
