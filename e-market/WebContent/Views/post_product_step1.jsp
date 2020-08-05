<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Universal - All In 1 Template</title>
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
        <div class="row">
          <div id="checkout" class="col-lg-9">
            <div class="box">
              <form method="get" action="post-product-s2">
                <ul class="nav nav-pills nav-fill">
                  <li class="nav-item"><a href="shop-checkout2.html" class="nav-link active"><i
                        class="fa fa-truck"></i><br>CATEGORY LEVEL 1</a></li>
                  <li class="nav-item"><a href="#" class="nav-link disabled"><i class="fa fa-money"></i><br>Product Information</a></li>
                  <li class="nav-item"><a href="#" class="nav-link disabled"><i class="fa fa-eye"></i><br>Upload Photos</a></li>
                </ul>
                <div class="content">
                  <div class="row">
	                  <c:forEach items="${listCategoriesLV1}" var="category">
	                  	<div class="col-sm-6">
	                      <div class="box shipping-method">
	                        <h4>${category.getName()}</h4>
	                        <div class="box-footer text-center">
	                          <input type="radio" name="category-lv1" value="${category.getId()}">
	                        </div>
	                      </div>
	                    </div>
	                  </c:forEach>
                  </div>
                </div>
                <div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
                  <div class="right-col">
                    <button type="submit" class="btn btn-template-main">NEXT STEP<i
                        class="fa fa-chevron-right"></i></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-3">
            <div id="order-summary" class="box mb-4 p-0">
              <div class="box-header mt-0">
                <h3>Order summary</h3>
              </div>
              <p class="text-muted text-small">Shipping and additional costs are calculated based on the values you have
                entered.</p>
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td>Order subtotal</td>
                      <th>$446.00</th>
                    </tr>
                    <tr>
                      <td>Shipping and handling</td>
                      <th>$10.00</th>
                    </tr>
                    <tr>
                      <td>Tax</td>
                      <th>$0.00</th>
                    </tr>
                    <tr class="total">
                      <td>Total</td>
                      <th>$456.00</th>
                    </tr>
                  </tbody>
                </table>
              </div>
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