<!-- <h3 class="module-title"><span><?php echo $heading_title; ?></span></h3> -->
<div class="row imgcategory">
    <?php foreach ($categories as $category) { ?>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
            <div class="product-thumb transition">
                <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" class="img-responsive"/></a></div>
                <h4><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
            </div>
        </div>
    <?php } ?>
</div>