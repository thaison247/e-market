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
  <script type="text/javascript" src="libraries/ckeditor/ckeditor.js"></script>
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
                <form method="post" action="post-product-s2">
                  <ul class="nav nav-pills nav-fill">
                    <li class="nav-item"><a href="shop-checkout2.html" class="nav-link disable"><i
                        class="fa fa-truck"></i><br>CATEGORY LEVEL 1</a></li>
                  	<li class="nav-item"><a href="#" class="nav-link active"><i class="fa fa-money"></i><br>Product Information</a></li>
                  	<li class="nav-item"><a href="#" class="nav-link"><i class="fa fa-eye"></i><br>Upload Photos</a></li>
                  </ul>
                  
                  <h4>Provide some information</h4>
				  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="input_category">Choose category</label>
	                      <select id="input_category" name="input_category"
										class="form-control" required style="width: 100%;">
								<option value="" disabled selected hidden>Select category </option>
								<c:forEach items="${listCategoriesLV2}" var="category">
									<option value="${category.getId()}">${category.getName()}</option>
								</c:forEach>
						  </select>
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="password_old">Product title </label>
	                      <input id="input_title" type="text" name="input_title" class="form-control">
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="input_price">Price</label>
	                      </br>
	                      <input type="number" min="0" step="1" id="input_price" name="input_price"
										placeholder="Price" class="form-control">
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="input_shortDescription">Short
									Description</label>
	                      <textarea id="input_shortDescription" placeholder="Short Description" rows="3" name="input_shortDescription" class="form-control"></textarea>
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="input_detailDescription">Detail
									Description</label>
	                      <textarea id="input_detailDescription" placeholder="Detail Description" rows="10" name="input_detailDescription" class="form-control"></textarea>
	                    </div>
	                  </div>
                  </div>
                  <h4>Seller information</h4>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="seller_phone">Phone number </label>
	                      <input id="seller_phone" type="text" name="seller_phone" value="0123456789" class="form-control" readonly>
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="seller_email">Email</label>
	                      <input id="seller_email" type="text" name="seller_email" value="nguyenthaison@gmail.com" class="form-control" readonly>
	                    </div>
	                  </div>
                  </div>
                  <div class="row">
	                  <div class="col-md-12">
	                    <div class="form-group">
	                      <label for="seller_address">Address</label>
	                      <input id="seller_address" type="text" name="seller_address" value="471A Cách mạng tháng 8, P13, Q10, TP.HCM" class="form-control" readonly>
	                    </div>
	                  </div>
                  </div>
                  <c:if test="${requestScope.postPrdErrMsg != null}">
						<div class="alert alert-block alert-error fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong><%= request.getAttribute("postPrdErrMsg") %></strong>
						</div>
				  </c:if>
							
				  <c:if test="${requestScope.inserPrdDAOErrMsg != null}">
						<div class="alert alert-block alert-error fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong><%= request.getAttribute("inserPrdDAOErrMsg") %></strong>
						</div>
				  </c:if>
                  
                  
                  <div class="box-footer d-flex flex-wrap align-items-center justify-content-between">
                    <div class="right-col">
                      <button type="submit" class="btn btn-template-main">Review order<i class="fa fa-chevron-right"></i></button>
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

	<script type="text/javascript">
		CKEDITOR.replace('input_detailDescription');
	</script>
	<!-- Javascript files-->
  	<jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>