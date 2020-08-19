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
    <div class="col-md-3">
        <!-- MENUS AND FILTERS-->
        <div class="panel panel-default sidebar-menu">
          <div class="panel-heading">
            <h3 class="h4 panel-title">Categories</h3>
          </div>
          <div class="panel-body">
            <ul class="nav nav-pills flex-column text-sm category-menu">
            
	            <!-- For each danh mục cấp 1 -->
	            <c:forEach items="${sessionScope.allCategories}" var="cat">
	            	<c:if test="${cat.getRootId() == 0}">
	            		<c:if test="${cat.getId() == requestScope.currCatId}">
		            		<li class="nav-item "><a href="category?cat_id=${cat.getId()}"
				                  class="nav-link active d-flex align-items-center justify-content-between"><span>${cat.getName()} </span><span
				                    class="badge badge-secondary">${cat.getQuantity()}</span></a>
				            </li>
	            		</c:if>
	            		<c:if test="${cat.getId() != requestScope.currCatId}">
		            		<li class="nav-item"><a href="category?cat_id=${cat.getId()}"
				                  class="nav-link d-flex align-items-center justify-content-between"><span>${cat.getName()} </span><span
				                    class="badge badge-secondary">${cat.getQuantity()}</span></a>
				            </li>
	            		</c:if>
		                    <ul class="nav nav-pills flex-column">
		                    
		                    	<!-- For each danh mục cấp 2 -->
	                            <c:forEach items="${sessionScope.allCategories}" var="cat2">
	                                <c:if test="${cat2.getRootId() == cat.getId()}">
	                                	<c:if test="${cat2.getId() == requestScope.currCatId}">
	                                		<li class="nav-item "><a href="category?cat_id=${cat2.getId()}" class="nav-link active">${cat2.getName()}</a></li>
	                                	</c:if>
	                                	<c:if test="${cat2.getId() != requestScope.currCatId}">
	                                		<li class="nav-item"><a href="category?cat_id=${cat2.getId()}" class="nav-link">${cat2.getName()}</a></li>
	                                	</c:if>
	                                </c:if>
	                            </c:forEach>
		                    </ul>
			            
	            	</c:if>
	            </c:forEach>
	        </ul>
          </div>
        </div>
        <div class="banner"><a href="shop-category.html"><img src="img/banner.jpg" alt="sales 2014"
              class="img-fluid"></a>
        </div>
   </div>
</body>

</html>