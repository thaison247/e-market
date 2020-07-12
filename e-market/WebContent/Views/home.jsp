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
	<jsp:include page="../Sections/header.jsp" flush="true"/>
	<!-- Header End======== -->

	<!-- Carousel    ========= -->
	<jsp:include page="../Sections/carousel.jsp" flush="true" />
	<!-- Carousel End========= -->

	<!-- Main Body ======== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<jsp:include page="../Sections/sidebar.jsp" flush="true">
					<jsp:param name="listCategories" value="${listCategories}" />
				</jsp:include>
				<!-- Sidebar end=============================================== -->

				<div class="span9">
					<div class="well well-small">
						<h4>Featured Products <small class="pull-right">200+ featured products</small></h4>
						<div class="row-fluid">
							<div id="featured" class="carousel slide">
								<div class="carousel-inner">
									<div class="item active">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="ProductController"><img src="themes/images/products/b1.jpg"
															alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="product_details.html"><img
															src="themes/images/products/b2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="product_details.html"><img
															src="themes/images/products/b3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="product_details.html"><img
															src="themes/images/products/b4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="product_details.html"><img
															src="themes/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<i class="tag"></i>
													<a href="product_details.html"><img
															src="themes/images/products/6.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/7.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/8.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/9.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/10.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/11.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/1.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/2.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/3.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/4.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
											<li class="span3">
												<div class="thumbnail">
													<a href="product_details.html"><img
															src="themes/images/products/5.jpg" alt=""></a>
													<div class="caption">
														<h5>Product name</h5>
														<h4><a class="btn" href="product_details.html">VIEW</a> <span
																class="pull-right">$222.00</span></h4>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
								<a class="right carousel-control" href="#featured" data-slide="next">›</a>
							</div>
						</div>
					</div>
					<h4>Latest Products </h4>
					<ul class="thumbnails">
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/6.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>

									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/7.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>
									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/8.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>
									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/9.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>
									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/10.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>
									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
						<li class="span3">
							<div class="thumbnail">
								<a href="product_details.html"><img src="themes/images/products/11.jpg" alt="" /></a>
								<div class="caption">
									<h5>Product name</h5>
									<p>
										Lorem Ipsum is simply dummy text.
									</p>
									<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
												class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
												class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
											href="#">$222.00</a></h4>
								</div>
							</div>
						</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<!-- Main Body End ======== -->

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