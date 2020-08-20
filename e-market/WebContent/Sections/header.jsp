<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
      <!-- Top bar-->
      <div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
              <c:if test="${sessionScope.user != null}">
	            <p>Welcome!<strong> ${sessionScope.user.getName()}</strong></p>
	          </c:if>
            </div>
            <div class="col-md-6">
              <div class="d-flex justify-content-md-end justify-content-between">
                <ul class="list-inline contact-info d-block d-md-none">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
                <c:if test="${sessionScope.user == null}">
              	<div class="login">
              		<a href="login?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']} " class="login-btn">
              			<i class="fa fa-sign-in"></i><span class="d-none d-md-inline-block">Log In</span>
                    </a>
                    <a href="register?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}" class="signup-btn"><i class="fa fa-user"></i><span
                    class="d-none d-md-inline-block">Register</span></a></div>
              </c:if>
              <c:if test="${sessionScope.user != null}">
	              <div class="login">
		              <a href="logout?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}" class="login-btn"><i
		                    class="fa fa-sign-out"></i><span class="d-none d-md-inline-block">Log out</span>
		              </a>
	              </div>
              </c:if>
                <ul class="social-custom list-inline">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Top bar end-->

      <!-- Navbar Start-->
      <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="HomeForward" class="navbar-brand home"><img src="img/logo.png" alt="Universal logo" class="d-none d-md-inline-block"><img src="img/logo-small.png" alt="Universal logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                	<a href="post-product-s1">Post Your Offer</a>
                </li>
                
                <!-- ========== FULL WIDTH MEGAMENU ==================-->
               <li class="nav-item menu-large dropdown"><a data-toggle="dropdown" class="dropdown-toggle">All Categories <b
                    class="caret"></b></a>
                <ul class="dropdown-menu megamenu">
                	<li>
                		<div class="row">
                			<!-- For each danh mục cấp 1 -->
				            <c:forEach items="${sessionScope.allCategories}" var="cat">
				                <c:if test="${cat.getRootId() == 0}">
				                	<div class="col-md-6 col-lg-3">
                        				<h5><a href="category?cat_id=${cat.getId()}">${cat.getName()} (${cat.getQuantity()})</a></h5>
                        				<div>
                          					<ul class="list-unstyled mb-3">
                          					<!-- For each danh mục cấp 2 -->
					                            <c:forEach items="${sessionScope.allCategories}" var="cat2">
					                                <c:if test="${cat2.getRootId() == cat.getId()}">
					                                    <li class="nav-item"><a href="category?cat_id=${cat.getId()}" class="nav-link">${cat2.getName()}</a></li>
					                                </c:if>
					                            </c:forEach>
                          					</ul>
                        				</div>
                      				</div>
				                </c:if>
				            </c:forEach>
                		</div>
                	</li>
                </ul>
              </li>
                <!-- ========== FULL WIDTH MEGAMENU END ==================-->
                <!-- ========== Contact dropdown ==================-->
                <c:if test="${sessionScope.user != null}">
	                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-user-circle fa-lg"></i> &nbsp;${sessionScope.user.getName()}<b class="caret"></b></a>
	                  <ul class="dropdown-menu">
	                  	<li class="dropdown-item"><a href="profile?user_id=${sessionScope.user.getId()}" class="nav-link"><i class="fa fa-user"></i> Profile</a></li>
	                    <li class="dropdown-item"><a href="personal-products?user_id=${sessionScope.user.getId()}" class="nav-link"><i class="fa fa-list"></i> My Products</a></li>
	                    <li class="dropdown-item"><a href="wishlist" class="nav-link"><i class="fa fa-heart"></i> My Wishlist</a></li>
	                    <li class="dropdown-item"><a href="logout" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></li>
	                  </ul>
	                </li>
                </c:if>
                <!-- ========== Contact dropdown end ==================-->
              </ul>
            </div>
            <div id="search" class="clearfix">
              <form action="search" method="get" class="navbar-form">
                <div class="input-group">
                  <input name="input_text" type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
                    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </header>
      <!-- Navbar End-->
</body>

</html>