<?php if (isset($categories) && count($categories)) { ?><div class="box hidden-xs" style="margin-top:-15px;">
<div id="alphabetm_module"> <div class="box-content"> <div class="box-heading" style="float:left;"><?php echo $heading_title; ?></div>
  <div class="letters" style="float:left; width: 80%;">	
    <?php foreach ($categories as $category) { ?>	    <div class="letter">&nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>	      <div class="mlist visible">      <?php if ($category['manufacturer']) { ?>	  	 	<?php $manufacturers = $category['manufacturer'];?> 	   <ul>	   	       <?php foreach ($manufacturers as $manufacturer) { ?>     <li><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></li>    <?php } ?> 	</ul>    <?php } ?>    </div>	</div>	<?php } ?>
    </div>	</div>
	</div>	</div>
	<?php } ?><script> $(document).ready(function () {       $('.letter').hover(        function () {                      $('div', this).slideDown(100);          },        function () {                      $('div', this).slideUp(300);        }    );  });</script><style>.letter {float:left; width:20px;}.letters {width:80%; overflow:hidden; display:inline-block; vertical-align:top; margin-right:20px; margin-bottom:5px;}.mlist {position:absolute; z-index:999}.visible {display:none;}.mlist ul {margin:0;padding:0;list-style:none;border:1px solid #ddd;padding:4px;background:white;}.mlist ul li{margin:5px}</style>