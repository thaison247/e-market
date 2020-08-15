<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>E-Market Home Page</title>
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
    <div id="heading-breadcrumbs">
      <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
          <div class="col-md-7">
            <h1 class="h2">Home Page</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active"></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="content">
      <div class="container">
        <section class="bar">
          <div class="row">
            <div class="col-md-12">
              <div class="heading">
                <h2>Categories</h2>
              </div>
            </div>
          </div>
          <div class="row portfolio text-center">
          <c:forEach items = "${sessionScope.allCategories}" var = "cat">
          <div class="col-md-3">
              <div class="box-image">
                <div class="image"><img src="img/cat${cat.getId()}.jpg" alt="" class="img-fluid">
                  <div class="overlay d-flex align-items-center justify-content-center">
                    <div class="content">
                      <div class="name mb-small">
                        <h3><a href="category?cat_id=${cat.getId()}" class="color-white">${cat.getName()}</a></h3>
                      </div>
                      <div class="text">
                        <p class="d-none">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                        <p class="buttons"><a href="category?cat_id=${cat.getId()}"
                            class="btn btn-template-outlined-white">View</a><a href="category?cat_id=${cat.getId()}"
                            class="btn btn-template-outlined-white">Website</a></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          </div>
        </section>
      </div>
      <section class="bar background-pentagon no-mb">
        <div class="container">
          <div class="row showcase text-center">
            <div class="col-md-3 col-sm-6">
              <div class="item">
                <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-align-justify"></i></div>
                <h4><span class="h1 counter">580</span><br> Websites</h4>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="item">
                <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-users"></i></div>
                <h4><span class="h1 counter">100</span><br>Satisfied Clients</h4>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="item">
                <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-copy"></i></div>
                <h4><span class="h1 counter">320</span><br>Projects</h4>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="item">
                <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-font"></i></div>
                <h4><span class="h1 counter">923</span><br>Magazines and Brochures</h4>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="bar bg-gray">
        <div class="container">
          <div class="heading text-center">
            <h2>Our Clients</h2>
          </div>
          <ul class="list-unstyled owl-carousel customers no-mb">
            <li class="item"><img src="img/customer-1.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-2.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-3.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-4.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-5.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-6.png" alt="" class="img-fluid"></li>
          </ul>
        </div>
      </section>
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