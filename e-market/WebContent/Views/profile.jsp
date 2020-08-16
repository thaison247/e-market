<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${user.getName()}</title>
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
            <h1 class="h2">${user.getName()}</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
              <li class="breadcrumb-item active">USER PROFILE</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
    <div id="content">
        <div class="container">
	          <div class="row bar">
	          	<div class="col-lg-3 mt-4 mt-lg-0">
	              <!-- CUSTOMER MENU -->
	              <div class="panel panel-default sidebar-menu">
	                <div class="panel-heading">
	                  <h3 class="h4 panel-title">Customer section</h3>
	                </div>
	                <div class="panel-body">
	                  <ul class="nav nav-pills flex-column text-sm">
	                  	<li class="nav-item"><a href="profile?user_id=${user.getId()}" class="nav-link active"><i class="fa fa-user fa-lg"></i> Profile</a></li>
	                    <li class="nav-item"><a href="personal-products?user_id=${user.getId()}" class="nav-link "><i class="fa fa-list"></i> Personal products</a></li>
	                    <li class="nav-item"><a href="shop?user_id=${user.getId()}" class="nav-link "><i class="fa fa-list"></i> Shop</a></li>
	                    <c:if test="${sessionScope.user.getId() ==  user.getId()}">
		                    <li class="nav-item"><a href="my-wishlist" class="nav-link"><i class="fa fa-heart"></i> My wishlist</a></li>
		                    <li class="nav-item"><a href="logout?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></li>
	                    </c:if>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          
	            <div class="col-lg-9">
	              <div class="box mt-3">
		              <div class="heading">
		                <h3 class="text-uppercase">Basic Information</h3>
		              </div>
		              <form>
		                <div class="row">
		                  <div class="col-md-9">
		                    <div class="form-group">
		                      <label for="input_name">Name</label>
		                      <input id="input_name" type="text" name="input_name" class="form-control" value="${user.getName()}" readonly>
		                    </div>
		                  </div>
		                </div>
		                <div class="row">
		                  <div class="col-md-9">
		                    <div class="form-group">
		                      <label for="input_email">Email</label>
		                      <input id="input_email" type="text" name="input_email" class="form-control" value="${user.getEmail()}" readonly>
		                    </div>
		                  </div>
		                </div>
		                <div class="row">
		                  <div class="col-md-9">
		                    <div class="form-group">
		                      <label for="input_phone">Phone number</label>
		                      <input id="input_phone" type="text" name="input_phone" class="form-control" value="${user.getPhone()}" readonly>
		                    </div>
		                  </div>
		                </div>
		                <div class="row">
		                  <div class="col-md-9">
		                    <div class="form-group">
		                      <label for="input_address">Address</label>
		                      <input id="input_address" type="text" name="input_address" class="form-control" value="${user.getAddress()}" readonly>
		                    </div>
		                  </div>
		                </div>
		                <!-- <div class="text-center">
		                  <button type="submit" class="btn btn-template-outlined"><i class="fa fa-save"></i> Save new
		                    password</button>
		                </div> -->
		              </form>
           		</div>
	          </div>
	        </div>
        </div>
      </div>
  	</div>
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>