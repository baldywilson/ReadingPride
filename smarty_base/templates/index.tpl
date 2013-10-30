{extends file="base.tpl"}

{block name=headers}
{literal}
<style>
#slides {
display: none;
}
#slides .slidesjs-navigation {
      margin-top:5px;
    }

    a.slidesjs-next,
    a.slidesjs-previous,
    a.slidesjs-play,
    a.slidesjs-stop {
      background-image: url(img/btns-next-prev.png);
      background-repeat: no-repeat;
      display:block;
      width:12px;
      height:18px;
      overflow: hidden;
      text-indent: -9999px;
      float: left;
      margin-right:5px;
    }

    a.slidesjs-next {
      margin-right:10px;
      background-position: -12px 0;
    }

    a:hover.slidesjs-next {
      background-position: -12px -18px;
    }

    a.slidesjs-previous {
      background-position: 0 0;
    }

    a:hover.slidesjs-previous {
      background-position: 0 -18px;
    }

    a.slidesjs-play {
      width:15px;
      background-position: -25px 0;
    }

    a:hover.slidesjs-play {
      background-position: -25px -18px;
    }

    a.slidesjs-stop {
      width:18px;
      background-position: -41px 0;
    }

    a:hover.slidesjs-stop {
      background-position: -41px -18px;
    }

    .slidesjs-pagination {
      margin: 7px 0 0;
      float: right;
      list-style: none;
    }

    .slidesjs-pagination li {
      float: left;
      margin: 0 1px;
    }

    .slidesjs-pagination li a {
      display: block;
      width: 13px;
      height: 0;
      padding-top: 13px;
      background-image: url(img/pagination.png);
      background-position: 0 0;
      float: left;
      overflow: hidden;
    }

    .slidesjs-pagination li a.active,
    .slidesjs-pagination li a:hover.active {
      background-position: 0 -13px
    }

    .slidesjs-pagination li a:hover {
      background-position: 0 -26px
    }

    #slides a:link,
    #slides a:visited {
      color: #333
    }

    #slides a:hover,
    #slides a:active {
      color: #9e2020
    }

</style>

<script src="js/jquery.slides.min.js"></script>

<script>
	$(function(){
		$("#slides").slidesjs({
			width: 724,
			height: 420,
			play: {
				active: true,
				effect: "fade",
				interval: 5000,
				auto: true,
				swap: true,
				pauseOnHover: false,
				restartDelay: 2500 },
			navigation: {
				active: false,
				effect: "fade"
			}
		});
});
</script>


{/literal}
{/block}

{block name=navbar}

<div id="navwrapper">

{section name=row loop=$crumb}
<div class="month"><a href="{$crumb[row].url}">{$crumb[row].name}</a></div>
{/section}
</div>


{/block}

{block name=body}


			{section name=row loop=$results}
			<div  class="entry">
				{if $results[row].idx eq '1'}
					<!-- <div id="slides">
						{section name=slide loop=$galleryimg}
						<img src="img/festival/{$galleryimg[slide]}" alt="Reading Pride 2012 festival slideshow" />
						{/section}
					</div> -->
          <iframe src="http://player.vimeo.com/video/70545766" width="700" height="400" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> 

					{$results[row].full_desc}
				
				{else}
						<div class="heading col_{$results[row].color} dropshadow"><a href="view.php?id={$results[row].pageid}">{$results[row].title}</a></div>
						<div class="content">{$results[row].brief_desc} <a class="quicklink" style="text-align: right;" href="view.php?id={$results[row].pageid}">Read more</a>
						</div>
				{/if}

			</div>
			{/section}

{/block}

