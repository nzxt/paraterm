<?php echo $header; ?>
<div>
  <style type="text/css">
  * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    font-family: arial;
  }

  html {
    position: relative;
    min-height: 100%;
}
  body {
    background: #fff;
  }
  footer {
    position: absolute;
    left: 0;
    bottom: 0;
    height: 100px;
    width: 100%;
    overflow:hidden;
}

  .login-form {
    width: 400px;
    padding: 40px 30px;
    background: #eee;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    position: absolute;
    margin-left: auto;
    margin-right: auto;
    left: 0;
    right: 0;
    top: 50%;
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
  }

  .mod-form-group {
    position: relative;
    margin-bottom: 15px;
  }

  .mod-form-control {
    width: 100%;
    height: 50px;
    border: none;
    padding: 5px 7px 5px 15px;
    background: #fff;
    color: #666;
    border: 2px solid #ddd;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
  }
  .mod-form-control:focus, .mod-form-control:focus + .fa {
    border-color: #10CE88;
    color: #10CE88;
  }

  .mod-form-group .fa {
    position:absolute;
    right: 15px;
    top: 17px;
    color: #999;
  }
  .log-status.wrong-entry .mod-form-control, .wrong-entry .mod-form-control + .fa {
    border-color: #ed1c24;
    color: #ed1c24;
  }

  .log-btn {
    background: #0AC986;
    display: inline-block;
    width: 100%;
    font-size: 16px;
    height: 50px;
    color: #fff;
    text-decoration: none;
    border: none;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
  }

  .link {
    text-decoration: none;
    color: #C6C6C6;
    float: right;
    font-size: 12px;
    margin-bottom: 15px;
  }
  .link:hover {
    text-decoration: underline;
    color: #8C918F;
  }

  @-moz-keyframes wrong-log {
    0%, 100% {
      left: 0px;
    }
    20% , 60% {
      left: 15px;
    }
    40% , 80% {
      left: -15px;
    }
  }

</style>
<div id="content">
  <div class="container-fluid"><br />
    <br />
    <div class="row">
<!-- <div class="login-form"> -->
<form action="<?php echo $action; ?>" method="post" class="login-form" enctype="multipart/form-data">

     <h3> <i class="fa fa-lock"></i> <?php echo $text_login; ?></h3>

     <?php if ($success) { ?>
     <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
       <button type="button" class="close" data-dismiss="alert">&times;</button>
     </div>
     <?php } ?>
     <?php if ($error_warning) { ?>
     <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
       <button type="button" class="close" data-dismiss="alert">&times;</button>
     </div>
     <?php } ?>


     <div class="mod-form-group ">
       <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="mod-form-control" />
       <h3><i class="fa fa-user"></i></h3>
     </div>
     <div class="mod-form-group log-status">
       <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="mod-form-control" />
       <h3><i class="fa fa-lock"></i></h3>

       <?php if ($forgotten) { ?>
                <span class="help-block"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
                <?php } ?>
     </div>
      <div class="text-right">
                <button type="submit" class="log-btn"><i class="fa fa-key"></i> <?php echo $button_login; ?></button>
              </div>
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>


   </form>
  <!-- </div> -->
  </div>
  </div>
  </div>
</div>
<?php echo $footer; ?>

