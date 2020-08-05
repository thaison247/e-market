<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Bootshop online Shopping cart</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<!--Less styles -->
	<!-- Other Less css file //different less files has different color scheam
		<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
		<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
		<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
		-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
		<script src="themes/js/less.js" type="text/javascript"></script> -->

	<!-- Bootstrap style -->
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

	<!-- MainBody ============================= -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<jsp:include page="../Sections/sidebar.jsp" flush="true">
					<jsp:param name="listCategories" value="${listCategories}" />
				</jsp:include>
				<!-- Sidebar end=============================================== -->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li><a href="products.html">Products</a> <span class="divider">/</span></li>
						<li class="active">product Details</li>
					</ul>
					<div class="row">
						<div id="gallery" class="span3">
							<a href="productimages/${product.getId()}/1.jpg" title="${product.getName()}">
								<img src="productimages/${product.getId()}/1.jpg" style="width:100%"
									alt="${product.getName()}" />
							</a>
							<div id="differentview" class="moreOptopm carousel slide">
								<div class="carousel-inner">
									<div class="item active">
										<a href="productimages/${product.getId()}/1.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/1.jpg" alt="" /></a>
										<a href="productimages/${product.getId()}/2.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/2.jpg" alt="" /></a>
										<a href="productimages/${product.getId()}/3.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/3.jpg" alt="" /></a>
									</div>
									<div class="item">
										<a href="productimages/${product.getId()}/1.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/1.jpg" alt="" /></a>
										<a href="productimages/${product.getId()}/2.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/2.jpg" alt="" /></a>
										<a href="productimages/${product.getId()}/3.jpg"> <img style="width:29%"
												src="productimages/${product.getId()}/3.jpg" alt="" /></a>
									</div>
								</div>
								<!--  
				  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
				  <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
				  -->
							</div>

							<div class="btn-toolbar">
								<div class="btn-group">
									<span class="btn"><i class="icon-envelope"></i></span>
									<span class="btn"><i class="icon-print"></i></span>
									<span class="btn"><i class="icon-zoom-in"></i></span>
									<span class="btn"><i class="icon-star"></i></span>
									<span class="btn"><i class=" icon-thumbs-up"></i></span>
									<span class="btn"><i class="icon-thumbs-down"></i></span>
								</div>
							</div>
						</div>
						<div class="span6">
							<h3>
  								${product.getName()}
							</h3>
							<small>${product.getShortDesc()} </small>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>${product.getPrice()}</span></label>
									<div class="controls">
										<input type="number" class="span1" placeholder="Qty." />
										<button type="submit" class="btn btn-large btn-primary pull-right"> Add to cart
											<i class=" icon-shopping-cart"></i></button>
									</div>
								</div>
							</form>

							<p>
								${product.getShortDesc()}

							</p>
							
							<a class="btn btn-small pull-right" href="#detail">More Details</a>
							<br class="clr" />
							<a href="#" name="detail"></a>
							<hr class="soft" />
						</div>

						<div class="span9">
							<ul id="productDetail" class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
								<li><a href="#profile" data-toggle="tab">Related Products</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">
									<h4>Product Information</h4>
									${product.getDetailDesc()}
								</div>
								<div class="tab-pane fade" id="profile">
									<div id="myTab" class="pull-right">
										<a href="#listView" data-toggle="tab"><span class="btn btn-large"><i
													class="icon-list"></i></span></a>
										<a href="#blockView" data-toggle="tab"><span
												class="btn btn-large btn-primary"><i
													class="icon-th-large"></i></span></a>
									</div>
									<br class="clr" />
									<hr class="soft" />
									<div class="tab-content">
										<div class="tab-pane" id="listView">
										<c:forEach items="${listRelativeProducts}" var="prd">
											<div class="row">
												<div class="span2">
													<img src="productimages/${prd.getId()}/1.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>${prd.getName()}</h5>
													<p>
														${prd.getShortDesc()}
													</p>
													<a class="btn btn-small pull-right" href="ProductDetail?product_id=${prd.getId()}">View
														Details</a>
													<br class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>${prd.getPrice()}</h3>
														<label class="checkbox">
															<input type="checkbox"> Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																	class=" icon-shopping-cart"></i></a>
															<a href="product_details.html" class="btn btn-large"><i
																	class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
										</c:forEach>
										</div>
										<div class="tab-pane active" id="blockView">
										
											<ul class="thumbnails">
												<c:forEach  items="${listRelativeProducts}" var="prd">
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
																src="themes/images/products/10.jpg" alt="" /></a>
														<div class="caption">
															<h5>${prd.getName()}</h5>
															<p>
																${prd.getShortDesc()}
															</p>
															<h4 style="text-align:center"><a class="btn"
																	href="product_details.html"> <i
																		class="icon-zoom-in"></i></a> <a class="btn"
																	href="#">Add to <i
																		class="icon-shopping-cart"></i></a> <a
																	class="btn btn-primary" href="#">&euro;${prd.getPrice()}</a>
															</h4>
														</div>
													</div>
												</li>
												</c:forEach>
											</ul>
											<hr class="soft" />
										
											
										</div>
									</div>
									<br class="clr">
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->

	<!-- Footer ========= -->
	<jsp:include page="../Sections/footer.jsp" flush="true" />

	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
	<jsp:include page="../Sections/switch_themes.jsp"/>
</body>

</html>