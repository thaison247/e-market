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
	<script type="text/javascript" src="libraries/ckeditor/ckeditor.js"></script>
</head>

<body>
	<!-- Header    ======== -->
	<jsp:include page="../Sections/header.jsp" flush="true" />
	<!-- Header End======== -->

	<!-- Main Body ======== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li class="active">Post your offer</li>
					</ul>
					<h3> Post your offer</h3>
					<div class="well">
						<form class="form-horizontal" onsubmit="validate()" action="PostProductS2" method="POST">
							<h4>Provide some information</h4>
							<div class="control-group">
								<label class="control-label" for="input_category">Category<sup>*</sup></label>
								<div class="controls">
									<select id="input_category" name="input_category"
										class="form-control form-control-lg" required style="width: 82%;">
										<option value="" disabled selected hidden>Choose category</option>
										<c:forEach items="${listCategoriesLV2}" var="category">
											<option value="${category.getId()}">${category.getName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_title">Product title <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="input_title" name="input_title" placeholder="Product title"
										style="width: 80%;">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_price">Price <sup>*</sup></label>
								<div class="controls">
									<input type="number" min="0" step="100000" id="input_price" name="input_price"
										placeholder="Price">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_shortDescription">Short
									Description<sup>*</sup></label>
								<div class="controls">
									<textarea name = "input_shortDescription" id="input_shortDescription" placeholder="Short Description" rows="3"
										style="width: 80%;"> </textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_detailDescription">Detail
									Description<sup>*</sup></label>
								<div class="controls">
									<textarea name="input_detailDescription" id="input_detailDescription" placeholder="Detail Description" cols="8"
										rows="8" style="width: 80%;"> </textarea>
								</div>
							</div>
							<h4>Seller information</h4>
							<div class="control-group">
								<label class="control-label" for="seller_phone">Phone number <sup>*</sup></label>
								<div class="controls">
									<input type="text" name="seller_phone" id="seller_phone" value="0123456789"
										readonly>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="seller_email">Email <sup>*</sup></label>
								<div class="controls">
									<input type="text" name="seller_email" id="seller_email"
										value="nguyenthaison@gmail.com" readonly>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="seller_address">Address <sup>*</sup></label>
								<div class="controls">
									<input type="text" name="seller_address" id="seller_address"
										value="471A Cách mạng tháng 8, P13, Q10, TP.HCM" readonly style="width: 80%;">
								</div>
							</div>

							<p><sup>*</sup>Required field </p>
							
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

							<div class=" control-group">
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
	<!-- Main Body End ======== -->

	<!-- Footer ========= -->
	<jsp:include page="../Sections/footer.jsp" flush="true" />
	
	<script type="text/javascript">
		CKEDITOR.replace('input_detailDescription');
	</script>

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