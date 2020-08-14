<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${sessionScope.user.getName()}</title>
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
            <h1 class="h2">${sessionScope.user.getName()}</h1>
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
          	<div class="col-lg-3 mt-4 mt-lg-0">
              	<!-- CUSTOMER MENU -->
              <div class="panel panel-default sidebar-menu">
                <div class="panel-heading">
                  <h3 class="h4 panel-title">Customer section</h3>
                </div>
                <div class="panel-body">
                  <ul class="nav nav-pills flex-column text-sm">
                    	<li class="nav-item"><a href="profile" class="nav-link "><i class="fa fa-user fa-lg"></i> Profile</a></li>
	                    <li class="nav-item"><a href="personal-products" class="nav-link active"><i class="fa fa-list"></i> Personal products</a></li>
	                    <li class="nav-item"><a href="my-shop" class="nav-link "><i class="fa fa-list"></i> Shop</a></li>
	                    <li class="nav-item"><a href="my-wishlist" class="nav-link"><i class="fa fa-heart"></i> My wishlist</a></li>
	                    <li class="nav-item"><a href="logout" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></li>
                  </ul>
                </div>
              </div>
            </div>
          
          <div id="customer-order" class="col-lg-9">
               <div class="box" style="margin-top: 20px;">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th colspan="2" class="border-top-0">Product</th>
                        <th class="border-top-0">Date</th>
                        <th class="border-top-0">Price</th>
                        <!-- <th class="border-top-0">Seller</th> -->
                        <th class="border-top-0">Status</th>
                      </tr>
                    </thead>
                    <tbody>
	                    <c:forEach items="${listProducts}" var="prd">
	                    	<tr>
		                        <td><a href="product-detail?product_id=${prd.getId()}"><img src="productimages/${prd.getId()}/1.jpg" alt="${prd.getName()}" class="img-fluid"></a></td>
		                        <td style="width: 230px;"><a href="product-detail?product_id=${prd.getId()}">${prd.getName()}</a></td>
		                        <td>${prd.getDate()}</td>
		                        <td>${prd.getPrice()}</td>
		                        <%-- <td>${prd.getSellerId()}</td> --%>
		                        <td>
		                        	<c:if test="${prd.isSold() == false}">
		                        		<span class="badge badge-success">Available</span>
		                        	</c:if>
		                        	<c:if test="${prd.isSold() != false}">
		                        		<span class="badge badge-danger">Sold</span>
		                        	</c:if>
		                        </td>
	                      	</tr>
	                    </c:forEach>
                   </table>
                </div>
                <div class="row addresses">
                  <div class="col-md-6 text-right">
                    <h3 class="text-uppercase">Invoice address</h3>
                    <p>John Brown<br>					    13/25 New Avenue<br>					    New Heaven<br>					    45Y 73J<br>					    England<br>					    Great Britain</p>
                  </div>
                  <div class="col-md-6 text-right">
                    <h3 class="text-uppercase">Shipping address</h3>
                    <p>John Brown<br>					    13/25 New Avenue<br>					    New Heaven<br>					    45Y 73J<br>					    England<br>					    Great Britain</p>
                  </div>
                </div>
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