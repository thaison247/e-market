<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Register</title>
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
  <!-- Tweaks for older IEs-->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
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
            <h1 class="h2">New Account / Sign In</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">New Account / Sign In</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="content">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-6 ">
            <div class="box">
              <h2 class="text-uppercase">NEW ACCOUNT</h2>
              <p class="lead">You have registered yet? Let's <a href="login?from=${from}">Log In</a></p>
              <hr>
              <form action="register" method="POST">
              	<div class="form-group">
                  <label for="input_name">Your Name</label>
                  <input name="input_name" id="input_name" type="text" placeholder="Example: Tran Duc Bo" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="input_email">Email</label>
                  <input name="input_email" id="input_email" type="text" placeholder="Example: abc123@info.com" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="input_phone">Phone Number</label>
                  <input name="input_phone" id="input_phone" type="text" placeholder="Example: 0987 278 967" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="input_address">Address</label>
                  <input name="input_address" id="input_address" type="text" placeholder="Example: 225 Nguyễn Văn, Phường 4, Quận 5, TP.HCM" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="input_password">Password</label>
                  <input name="input_password" id="input_password" type="password" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="repeat_password">Repeat Password</label>
                  <input name="repeat_password" id="repeat_password" type="password" class="form-control" required>
                </div>
                <div class="form-group">
                  <input name="from" id="from" type="hidden" class="form-control" value="${from}">
                </div>
                <div class="form-group">
                  <input name="from" id="from" type="hidden" class="form-control" value="${from}">
                </div>
                <c:if test="${requestScope.registerMsg != null}">
					<div role="alert" class="alert alert-warning">${registerMsg}</div>
				</c:if>
                <div class="text-center">
                
                  <button type="submit" class="btn btn-template-outlined"><i class="fa fa-user-md"></i>
                    REGISTER</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- FOOTER -->
    <jsp:include page="../Sections/footer.jsp" flush="true"/>
  </div>
  
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>