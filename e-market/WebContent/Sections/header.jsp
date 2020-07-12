<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="span6">Welcome!<strong> User</strong></div>
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
                    <a class="brand" href="index.html"><img src="themes/images/logo.png" alt="Bootsshop" /></a>
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
                        <li class=""><a href="special_offer.html">Specials Offer</a></li>
                        <li class=""><a href="normal.html">Delivery</a></li>
                        <li class=""><a href="RegisterController">Register</a></li>
                        <li class="">
                            <a href="LoginController" role="button" style="padding-right:0"><span
                                    class="btn btn-large btn-success">Login</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</body>

</html>