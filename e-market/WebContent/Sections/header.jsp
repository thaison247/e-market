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

    <div id="header">
        <div class="container">
            <div id="welcomeLine" class="row">
                <c:if test="${sessionScope.user != null}">
                    <div class="span6">Welcome!<strong> ${sessionScope.user.getName()}</strong></div>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <div class="span6">Welcome!<strong> </strong></div>
                </c:if>
                <div class="span6">
                    <div class="pull-right">
                        <a href="product_summary.html"><span class="">Fr</span></a>
                        <a href="product_summary.html"><span class="">Es</span></a>
                        <span class="btn btn-mini">En</span>
                        <a href="product_summary.html"><span>&pound;</span></a>
                        <span class="btn btn-mini">$155.00</span>
                        <a href="product_summary.html"><span class="">$</span></a>
                        <a href="product_summary.html"><span class="btn btn-mini btn-primary"><i
                                    class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a>
                    </div>
                </div>
            </div>
            <!-- Navbar ================================================== -->
            <div id="logoArea" class="navbar">
                <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-inner">
                    <a class="brand" href="HomeForward"><img src="themes/images/logo.png" alt="Bootsshop" /></a>
                    <form class="form-inline navbar-search" method="post" action="products.html">
                        <input id="srchFld" class="srchTxt" type="text" />
                        <select class="srchTxt">
                            <option>All</option>
                            <option>CLOTHES </option>
                            <option>FOOD AND BEVERAGES </option>
                            <option>HEALTH & BEAUTY </option>
                            <option>SPORTS & LEISURE </option>
                            <option>BOOKS & ENTERTAINMENTS </option>
                        </select>
                        <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                    </form>
                    <ul id="topMenu" class="nav pull-right">
                    	<li class=""><a href="PostProductS1">Post your offers</a></li>
                        <c:if test="${sessionScope.user != null}">
                        	<li class=""><a href="Profile">Profile</a></li>
                        </c:if>
                        <li class=""><a href="RegisterController">Register</a></li>
                        <li class="">
                            <c:if test="${sessionScope.user == null}">
                                <a href="LoginController?from=${requestScope['javax.servlet.forward.request_uri']}"
                                    role="button" style="padding-right:0">
                                    <span class="btn btn-large btn-success">Login</span>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <a href="LogoutController?from=${requestScope['javax.servlet.forward.request_uri']}"
                                    role="button" style="padding-right:0">
                                    <span class="btn btn-large btn-success">Logout</span>
                                </a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</body>

</html>