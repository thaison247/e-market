<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
   	<link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen" />
	<link href="themes/css/base.css" rel="stylesheet" media="screen" />
	<!-- Bootstrap style responsive -->
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
	<!-- Google-code-prettify -->
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
	<!-- fav and touch icons -->
	<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="themes/images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="themes/images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
</head>

<body>

	<!-- Header    ======== -->
	<jsp:include page="../Sections/header.jsp" flush="true"/>
	<!-- Header End======== -->

  	<div id="mainBody">
		<div class="container">
			<div class="row">
				<div id="sidebar" class="span3">
					<div class="well well-small"><a id="myCart" href="product_summary.html"><img
								src="themes/images/ico-cart.png" alt="cart">3 Items in your cart <span
								class="badge badge-warning pull-right">$155.00</span></a></div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a> ELECTRONICS [230]</a>
							<ul>
								<li><a class="active" href="products.html"><i class="icon-chevron-right"></i>Cameras
										(100) </a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Computers, Tablets &
										laptop (30)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Mobile Phone (80)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Sound & Vision (15)</a>
								</li>
							</ul>
						</li>
						<li class="subMenu"><a> CLOTHES [840] </a>
							<ul style="display:none">
								<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Clothing (45)</a>
								</li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Shoes (8)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Hand Bags (5)</a>
								</li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Men's Clothings (45)</a>
								</li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Men's Shoes (6)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Kids Clothing (5)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Kids Shoes (3)</a></li>
							</ul>
						</li>
						<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
							<ul style="display:none">
								<li><a href="products.html"><i class="icon-chevron-right"></i>Angoves (35)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Bouchard Aine & Fils
										(8)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>French Rabbit (5)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Louis Bernard (45)</a>
								</li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>BIB Wine (Bag in Box)
										(8)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Other Liquors & Wine
										(5)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Garden (3)</a></li>
								<li><a href="products.html"><i class="icon-chevron-right"></i>Khao Shong (11)</a></li>
							</ul>
						</li>
						<li><a href="products.html">HEALTH & BEAUTY [18]</a></li>
						<li><a href="products.html">SPORTS & LEISURE [58]</a></li>
						<li><a href="products.html">BOOKS & ENTERTAINMENTS [14]</a></li>
					</ul>
					<br />
					<div class="thumbnail">
						<img src="themes/images/products/panasonic.jpg" alt="Bootshop panasonoc New camera" />
						<div class="caption">
							<h5>Panasonic</h5>
							<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
										class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
										class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a></h4>
						</div>
					</div><br />
					<div class="thumbnail">
						<img src="themes/images/products/kindle.png" title="Bootshop New Kindel" alt="Bootshop Kindel">
						<div class="caption">
							<h5>Kindle</h5>
							<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
										class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
										class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a></h4>
						</div>
					</div><br />
					<div class="thumbnail">
						<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods"
							alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer ========= -->
	<jsp:include page="../Sections/footer.jsp" flush="true" />

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
  </script>
</body>

</html>