<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li class="active">Registration</li>
					</ul>
					<h3> Registration</h3>
					<div class="well">
						<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	 <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
						<form class="form-horizontal">
							<h4>Your personal information</h4>
							<div class="control-group">
								<label class="control-label" for="inputLnam">Your name <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="inputLnam" placeholder="Last Name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_email">Email <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="input_email" placeholder="Email">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_phone">Phone <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="input_phone" placeholder="Phone">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="address">Address<sup>*</sup></label>
								<div class="controls">
									<input type="text" id="address" placeholder="Adress" /> <span>Street address, P.O.
										box, company name, c/o</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_password">Password <sup>*</sup></label>
								<div class="controls">
									<input type="password" id="input_password" placeholder="Password">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="repeat_password">Repeat Password <sup>*</sup></label>
								<div class="controls">
									<input type="password" id="repeat_password" placeholder="Password">
								</div>
							</div>
							<div class="alert alert-block alert-error fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting
								industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
							</div>

							<p><sup>*</sup>Required field </p>

							<div class="control-group">
								<div class="controls">
									<input type="hidden" name="email_create" value="1">
									<input type="hidden" name="is_new_customer" value="1">
									<input class="btn btn-large btn-success" type="submit" value="Register" />
								</div>
							</div>
						</form>
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