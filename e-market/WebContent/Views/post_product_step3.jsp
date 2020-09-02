<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Post Your Offer</title>
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
</head>

<body>
	<!-- Header    ======== -->
	<jsp:include page="../Sections/header.jsp" flush="true"/>
	<!-- Header End======== -->

	<!-- Main Body ======== -->
	<div id="content">
        <div class="container">
          <div class="row justify-content-center align-items-center">
            <div id="checkout" class="col-lg-9">
              <div class="box">
                <form method="post" action="post-product-s3" enctype="multipart/form-data">
                  <ul class="nav nav-pills nav-fill">
                    <li class="nav-item"><a href="shop-checkout2.html" class="nav-link"><i class="fa fa-question-circle-o" aria-hidden="true"></i><br>Type of product</a></li>
                    <li class="nav-item"><a href="shop-checkout2.html" class="nav-link disable"><i
                        class="fa fa-truck"></i><br>Category level 1</a></li>
                  	<li class="nav-item"><a href="#" class="nav-link disable"><i class="fa fa-money"></i><br>Product Information</a></li>
                  	<li class="nav-item"><a href="#" class="nav-link active"><i class="fa fa-eye"></i><br>Upload Photos</a></li>
                  </ul>
                  
                  <div class="custom-file">
					  <input id="input_images" name="input_images" accept="image/*" type="file"
												multiple="multiple" class="custom-file-input">
					  <label class="custom-file-label" for="input_images">Choose photos</label>
				  </div>
                  
                  <div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
                    <div class="right-col">
                      <button type="submit" class="btn btn-template-main">Finish<i class="fa fa-chevron-right"></i></button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
    </div>
	<!-- Main Body End ======== -->

	<!-- Footer ========= -->
	<jsp:include page="../Sections/footer.jsp" flush="true" />

	<!-- Javascript files-->
  	<jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>