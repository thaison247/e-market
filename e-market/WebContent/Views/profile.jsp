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
	<jsp:include page="../Sections/header.jsp" flush="true" />
	<!-- Header End======== -->

	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small"><a id="myCart" href="product_summary.html"><img
								src="themes/images/user-icon.png" alt="cart">3 Items in your cart <span
								class="badge badge-warning pull-right">$155.00</span></a></div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li><a href="Profile">Information</a></li>
						<li class="subMenu open"><a> Your Products </a>
							<ul style="display:block">
								<li><a href="PersonalProducts"><i class="icon-chevron-right"></i>Personal Pruducts (4)</a></li>
								<li><a href="ShopProducts"><i class="icon-chevron-right"></i>Shop Products (32)</a></li>												
							</ul>
						</li>
						<li><a href="Profile">Wishlist</a></li>
					</ul>
					<br />
				</div>
				<!-- Sidebar end=============================================== -->
				
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li class="active">Page Title</li>
					</ul>
					<h4>User information</h4>
					<div class="control-group">
						<label class="control-label" for="user_name">Name <sup>*</sup></label>
						<div class="controls">
							<input type="text" name="user_name" id="user_name" value= "${userName}"
								readonly>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="seller_phone">Phone number <sup>*</sup></label>
						<div class="controls">
							<input type="text" name="seller_phone" id="seller_phone" value="${userPhone}"
								readonly>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="user_email">Email <sup>*</sup></label>
						<div class="controls">
							<input type="text" name="user_email" id="user_email"
								value="${userEmail}" readonly>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="user_address">Address <sup>*</sup></label>
						<div class="controls">
							<input type="text" name="user_address" id="user_address"
								value= "${userAddress}" readonly style="width: 80%;">
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