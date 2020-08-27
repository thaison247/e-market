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
                    	<li class="nav-item"><a href="profile?user_id=${user.getId()}" class="nav-link"><i class="fa fa-user fa-lg"></i> Profile</a></li>
	                    <li class="nav-item"><a href="personal-products?user_id=${user.getId()}" class="nav-link "><i class="fa fa-list"></i> Personal products</a></li>
	                    <li class="nav-item"><a href="shop?user_id=${user.getId()}" class="nav-link active"><i class="fa fa-columns" aria-hidden="true"></i> Shop</a></li>
	                    <c:if test="${sessionScope.user.getId() ==  user.getId()}">
		                    <li class="nav-item"><a href="wishlist" class="nav-link"><i class="fa fa-heart"></i> My wishlist</a></li>
		                    <li class="nav-item"><a href="logout?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></li>
	                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
          <c:if test="${existedShop == true}">
	          <div id="customer-order" class="col-lg-9">
	          		<h2>${shop.getName()}</h2>
	          		<p class="lead" style="margin-bottom: 10px;">${catName}</p>
	               <div class="box" style="margin-top: 20px; background: azure">
	                <div class="table-responsive">
	                	<c:if test="${sessionScope.user.getId() == user.getId()}">
		                	<div class="left-col">
		                		<a href="post-product-s1?type=shop">
		                			<button type="submit" class="btn btn-template-main">ADD PRODUCT <i class="fa fa-plus" aria-hidden="true"></i></button>
		                		</a>
	                  		</div>
                  		</c:if>
	                  <table class="table">
	                    <thead>
	                      <tr>
	                        <th colspan="2" class="border-top-0">Product</th>
	                        <th class="border-top-0">Date</th>
	                        <th class="border-top-0">Price</th>
	                        <!-- <th class="border-top-0">Seller</th> -->
	                        <th class="border-top-0">Status</th>
	                        <th class="border-top-0">Operator</th>
	                      </tr>
	                    </thead>
	                    <tbody>
		                    <c:forEach items="${listProducts}" var="prd">
		                    	<tr>
			                        <td><a href="product-detail?product_id=${prd.getId()}"><img src="productimages/${prd.getId()}/1.jpg" alt="${prd.getName()}" class="img-fluid"></a></td>
			                        <td style="width: 230px;"><a href="product-detail?product_id=${prd.getId()}">${prd.getName()}</a></td>
			                        <td>${prd.getDate()}</td>
			                        <td>${prd.getPrice()}</td>
			                        <td>
			                        	<c:if test="${prd.isSold() == false}">
			                        		<span class="badge badge-success">Available</span>
			                        	</c:if>
			                        	<c:if test="${prd.isSold() != false}">
			                        		<span class="badge badge-danger">Sold</span>
			                        	</c:if>
		                        	</td>
			                        <c:if test="${sessionScope.user != null && user.getId() == sessionScope.user.getId()}">
			                        	<td>
			                        		<div class="row">
				                        		<c:if test="${prd.isSold() == false}">
					                        		<form action="change-status" method="POST">
					                        			<input name="product_id" type="hidden" value="${prd.getId()}">
					                        			<input name="status" type="hidden" value="1">
					                        			<div title="Mark this product as sold">
										                  <button type="submit" class="btn btn-sm btn-info">
										                    <i class="fa fa-check" aria-hidden="true"></i>
										                  </button>
										                </div>
					                        		</form>
					                        	</c:if>
					                        	<c:if test="${prd.isSold() == true}">
					                        		<form action="change-status" method="POST">
					                        			<input name="product_id" type="hidden" value="${prd.getId()}">
					                        			<input name="status" type="hidden" value="0">
					                        			<div title="Mark this product as available">
										                  <button type="submit" class="btn btn-sm btn-success">
										                    <i class="fa fa-undo" aria-hidden="true"></i>
										                  </button>
										                </div>
					                        		</form>
					                        	</c:if>
			                        			<div title="Edit this product's information">
				                        			<a href="edit-product?product_id=${prd.getId()}">
				                        				<button class="btn btn-sm btn-warning">
									                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									                  </button>
				                        			</a>
								                </div>
					                        	<form action="delete-product" method="POST">
					                        		<input name="product_id" type="hidden" value="${prd.getId()}">
				                        			<div title="Delete this product">
									                  <button type="submit" class="btn btn-sm btn-danger">
									                    <i class="fa fa-trash" aria-hidden="true"></i>
									                  </button>
									                </div>
				                        		</form>
			                        		</div>
				                        </td>
			                        </c:if>
		                        	
		                      	</tr>
		                    </c:forEach>
	                   </table>
	                </div>
	                <div class="row addresses">
	                  <div class="col-md-6 text-right">
	                  </div>
	                  <div class="col-md-6 text-right">
	                    <h3 class="text-uppercase">Total</h3>
	                    <p>${listProducts.size()}<br>
	                  </div>
	                </div>
	              </div>
	           </div>
          </c:if>
          <c:if test="${existedShop == false}">
          	<div class="col-lg-8 ">
          		<c:if test="${sessionScope.user.getId() ==  user.getId()}">
          			<c:if test="${isWaiting == false}">
		          		<div class="box" style="background: azure;margin: 20px 0;">
			              <h2 class="text-uppercase">Open Shop</h2>
			              <p class="lead">Open shop to sell unlimited number of products</p>
			              <hr>
			              <form action="shop" method="post">
			              	<input name="owner_id" type="hidden" value="${sessionScope.user.getId()}">
			                <div class="form-group">
			                  <label for="shop_name">Shop name</label>
			                  <input name="shop_name" id="shop_name" type="text" class="form-control" required>
			                </div>
			                <div class="form-group">
		                      <label for="category">Choose category</label>
		                      <select id="category" name="category_id"
											class="form-control" required style="width: 100%;">
									<option value="" disabled selected hidden>Select category </option>
									<c:forEach items="${listCategoriesLv1}" var="category">
										<option value="${category.getId()}">${category.getName()}</option>
									</c:forEach>
							  </select>
		                    </div>
			                <div class="text-center">
			                  <button type="submit" class="btn btn-template-outlined"><i class="fa fa-paper-plane" aria-hidden="true"></i>
			                    Submit</button>
			                </div>
			              </form>
			            </div>
		            </c:if>
		            <c:if test="${isWaiting == true}">
		            	<div class="box" style="background: azure;margin: 20px 0;">
			              <h2 class="text-uppercase">You have sent a registration form to open shop</h2>
			              <p class="lead">Please wait for administrator acceptance</p>
			              <hr>
			              <form action="shop" method="post">
			              	<input name="owner_id" type="hidden" value="${sessionScope.user.getId()}">
			              	<div class="form-group">
			                  <label for="shop_owner">Shop Owner</label>
			                  <input name="shop_owner" id="shop_owner" type="text" class="form-control" value="${user.getName()}" readonly>
			                </div>
			                <div class="form-group">
			                  <label for="shop_name">Shop Name</label>
			                  <input name="shop_name" id="shop_name" type="text" class="form-control" value="${frm.getName()}" readonly>
			                </div>
			                <div class="form-group">
			                  <label for="category">Category</label>
			                  <c:forEach items="${listCategoriesLv1}" var="cat">
			                  	<c:if test="${cat.getId() == frm.getCategoryId()}">
			                  		<input name="category" id="category" type="text" class="form-control" value="${cat.getName()}" readonly>
			                  	</c:if>
			                  </c:forEach>
			                </div>
			                <div class="form-group">
			                  <label for="frm_date">Sent Date</label>
			                  <input name="frm_date" id="frm_date" type="text" class="form-control" value="${frm.getDate()}" readonly>
			                </div>
			              </form>
			            </div>
		            </c:if>
	            </c:if>
	            <c:if test="${sessionScope.user.getId() !=  user.getId()}">
	          		<div class="box" style="background: azure;margin: 20px 0;">
		              <h2 class="text-uppercase">This user does not own any shop</h2>
		              
		              <hr>
		            </div>
	            </c:if>
	        </div>
          </c:if>
         </div>
        </div>
      </div>
  	</div>
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>