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
    <div id="sidebar" class="span3">
        <div class="well well-small"><a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png"
                    alt="cart">3 Items in your cart <span class="badge badge-warning pull-right">$155.00</span></a>
        </div>

        <!-- DANH MỤC -->
        <ul id="sideManu" class="nav nav-tabs nav-stacked">
            <!-- For each danh mục cấp 1 -->
            <c:forEach items="${listCategories}" var="category">
                <c:if test="${category.getRootCategoryId() == 0}">
                    <li class="subMenu"><a>${category.categoryName}</a>
                    
                        <ul style="display:none">
                            <!-- For each danh mục cấp 2 -->
                            <c:forEach items="${listCategories}" var="category2">
                                <c:if test="${category2.getRootCategoryId() == category.getCategoryId()}">
                                    <li><a href="products.html"><i
                                                class="icon-chevron-right"></i>${category2.getCategoryName()}</a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <br />
        <div class="thumbnail">
            <img src="themes/images/products/panasonic.jpg" alt="Bootshop panasonoc New camera" />
            <div class="caption">
                <h5>Panasonic</h5>
                <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
                            class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
                            class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
            </div>
        </div><br />
        <div class="thumbnail">
            <img src="themes/images/products/kindle.png" title="Bootshop New Kindel" alt="Bootshop Kindel">
            <div class="caption">
                <h5>Kindle</h5>
                <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i
                            class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
                            class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
            </div>
        </div><br />
        <div class="thumbnail">
            <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
            <div class="caption">
                <h5>Payment Methods</h5>
            </div>
        </div>
    </div>
</body>

</html>