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
						<li class="active">Login</li>
					</ul>
					<h3> Login</h3>
					<hr class="soft" />

					<div class="row">
						<div class="span4">
							<div class="well">
								<h5>ALREADY REGISTERED ?</h5>
								<form action="LoginController" method="POST">
									<div class="control-group">
										<label class="control-label" for="input_email">Email</label>
										<div class="controls">
											<input class="span3" type="text" name="input_email" id="input_email"
												placeholder="Email">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="input_password">Password</label>
										<div class="controls">
											<input type="password" class="span3" name="input_password"
												id="input_password" placeholder="Password">
										</div>
									</div>
									<c:if test="${requestScope.loginMsg != null}">
										<div class="alert alert-block alert-error fade in">
											<button type="button" class="close" data-dismiss="alert">×</button>
											<strong><%= request.getAttribute("loginMsg") %></strong>
										</div>
									</c:if>
									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn">Sign in</button> <a
												href="forgetpass.html">Forget password?</a>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="span1"> &nbsp;</div>
						<div class="span4">
							<div class="well">
								<h5>CREATE YOUR ACCOUNT</h5><br />
								Create an account by your email.<br /><br /><br />
								<form action="register.html">
									<button type="submit" class="btn block">Create Your Account</button>
								</form>
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
	<jsp:include page="../Sections/switch_themes.jsp" />
</body>

</html>