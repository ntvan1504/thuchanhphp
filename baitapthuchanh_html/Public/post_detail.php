<?php

$router = new Apps_Libs_Router();
$categories = new Apps_Models_Categories();
$posts = new Apps_Models_Posts();
$listCate = $categories->buildQueryParams([])->select();
$id = $router->getGET("id");

if ($id) {
    $postDetail = $posts->buildQueryParams([
        "where"=>"id='$id'"
    ])->selectOne(); 
    if(!$postDetail){
        $router->pageNotFound(); 
    }
}else{
    $router->pageNotFound();
}
?>
        
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Đồ ăn thức uống - Trang tin sốt nóng</title>

    <!-- Bootstrap core CSS -->
    <link href="../startbootstrap-clean-blog-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../startbootstrap-clean-blog-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../startbootstrap-clean-blog-gh-pages/css/clean-blog.min.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="<?php echo $router->createUrl('home') ?>">ĂN LÀ LẼ SỐNG</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="<?= $router->createUrl("home")?>">Home</a>
            </li>
            <?php
                foreach ($listCate as $row){
                    ?>
            <li class="nav-item">
              <a class="nav-link" href="<?= $router->createUrl("home",["cate_id" => $row["id"]]) ?>"><?= $row["name"] ?></a>
            </li>
            <?php } ?>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('../startbootstrap-clean-blog-gh-pages/img/chicken.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
              <div class="post-heading">
              <h1><?= $postDetail["name"] ?></h1>
              <h2 class="subheading"><?= $postDetail["description"] ?></h2>
              <span class="meta" style="color: orange;">Posted by
                <a class="doan" href="#" style="color: orange;">Đồ ăn thức uống</a>
                on <?= $postDetail["created_time"] ?></span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Post Content -->
    <article>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <p><?= $postDetail["content"] ?></p>
          </div>
        </div>
      </div>
    </article>

    <hr>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <ul class="list-inline text-center">
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
            </ul>
            <p class="copyright text-muted">Copyright &copy; Vân Website 2018</p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../startbootstrap-clean-blog-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="../startbootstrap-clean-blog-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../startbootstrap-clean-blog-gh-pages/js/clean-blog.min.js"></script>

  </body>

</html>
