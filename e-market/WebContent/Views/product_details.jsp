<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${product.getName()}</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="all,follow">
  <!-- Bootstrap CSS-->
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome CSS-->
  <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
  <!-- Google fonts - Roboto-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
  <!-- Bootstrap Select-->
  <link rel="stylesheet" href="vendor/bootstrap-select/css/bootstrap-select.min.css">
  <!-- owl carousel-->
  <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
  <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
  <!-- theme stylesheet-->
  <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
  <!-- Custom stylesheet - for your changes-->
  <link rel="stylesheet" href="css/custom.css">
  <!-- Favicon and apple touch icons-->
  <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
  <link rel="apple-touch-icon" sizes="57x57" href="img/apple-touch-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="img/apple-touch-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
  <!-- Tweaks for older IEs-->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
  <div id="all">
	<!-- Header    ======== -->
	<jsp:include page="../Sections/header.jsp" flush="true"/>
	<!-- Header End======== -->

    <div id="heading-breadcrumbs">
      <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
          <div class="col-md-7">
            <h1 class="h2">Portfolio - 4 columns</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Portfolio - 4 columns</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
          <div id="content">
        <div class="container">
          <div class="row bar">
            <!-- LEFT COLUMN _________________________________________________________-->
            <div class="col-lg-12">
              <h4>${product.getName()}</h4>
              <p class="lead">${product.getShortDesc()}</p>
              <p class="goToDescription"><a href="#details" class="scroll-to text-uppercase">Scroll to product details, material & care and sizing</a></p>
              <div id="productMain" class="row">
                <div class="col-sm-6">
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                    <div> <img src="productimages/${product.getId()}/1.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="productimages/${product.getId()}/2.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="productimages/${product.getId()}/3.jpg" alt="" class="img-fluid"></div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="box" style="margin: 0px 0;">
                    <form>
                      <div class="sizes" style="text-align: left;">
                        <h3>${product.getName()}</h3>
                        <p class="lead">${product.getShortDesc()}</p>
                      </div>
                      <p class="price" style="text-align: left;"><strong style="color: red; font-size: 30pt;">$</strong>${product.getPrice()}</p>
                      <p>
                        <button type="submit" class="btn btn-template-outlined"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                        <button type="submit" data-toggle="tooltip" data-placement="top" title="Add to wishlist" class="btn btn-default"><i class="fa fa-heart-o"></i></button>
                      </p>
                    </form>
                  </div>
                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/1.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/2.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/3.jpg" alt="" class="img-fluid"></button>
                  </div>
                </div>
              </div>
	            <ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
	              <li id="details" class="nav-item"><a id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
	                  aria-controls="pills-home" aria-selected="false" class="nav-link">Detail Description</a></li>
	              <li class="nav-item"><a id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab"
	                  aria-controls="pills-profile" aria-selected="true" class="nav-link active">Comments</a></li>
	            </ul>
	            <div id="pills-tabContent" class="tab-content">
	              <div id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" class="tab-pane fade">
	                <div id="details" class="box mb-4 mt-4">
					    <p></p>
					    <h4>Product details</h4>
					    ${product.getDetailDesc()}
					</div>
	              </div>
	              <div id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" class="tab-pane fade active show">
	                <div id="comments">
	                  <h4 class="text-uppercase">2 comments</h4>
	                  <div class="row comment">
	                    <div class="col-sm-3 col-md-2 text-center-xs">
	                      <p><img src="img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle"></p>
	                    </div>
	                    <div class="col-sm-9 col-md-10">
	                      <h5 class="text-uppercase">Julie Alma</h5>
	                      <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2011 at 12:00 am</p>
	                      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
	                        Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero
	                        sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
	                      <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a></p>
	                    </div>
	                  </div>
	                  <div class="row comment last">
	                    <div class="col-sm-3 col-md-2 text-center-xs">
	                      <p><img src="img/blog-avatar.jpg" alt="" class="img-fluid rounded-circle"></p>
	                    </div>
	                    <div class="col-sm-9 col-md-10">
	                      <h5 class="text-uppercase">Louise Armero</h5>
	                      <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2012 at 12:00 am</p>
	                      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
	                        Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero
	                        sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
	                      <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a></p>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
              
              <div id="product-social" class="box social text-center mb-5 mt-5">
                <h4 class="heading-light">Show it to your friends</h4>
                <ul class="social list-inline">
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="box text-uppercase mt-0 mb-small">
                    <h3>You may also like these products</h3>
                  </div>
                </div>
                <c:forEach  items="${listRelativeProducts}" var="prd">
	                <div class="col-lg-3 col-md-6">
	                  <div class="product">
	                    <div class="image"><a href="product-detail?product_id=${prd.getId()}"><img src="productimages/${prd.getId()}/1.jpg" alt="" class="img-fluid image1"></a></div>
	                    <div class="text">
	                      <h3 class="h5"><a style=" text-overflow: ellipsis; overflow: hidden; width: 250px;"  href="product-detail?product_id=${prd.getId()}">${prd.getName()}</a></h3>
	                      <p class="price">$ ${prd.getPrice()}</p>
	                    </div>
	                  </div>
	                </div>
                </c:forEach>
              </div>
           </div>
        </div>
      </div>
    <!-- GET IT-->
    <div class="get-it">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 text-center p-3">
            <h3>Do you want cool website like this one?</h3>
          </div>
          <div class="col-lg-4 text-center p-3"> <a href="#" class="btn btn-template-outlined-white">Buy this template
              now</a></div>
        </div>
      </div>
    </div>
    
    <!-- FOOTER -->
    <jsp:include page="../Sections/footer.jsp" flush="true"/>
  </div>
  
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>