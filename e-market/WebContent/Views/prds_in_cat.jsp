<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${cat.getName()}</title>
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

    <div id="heading-breadcrumbs">
      <div class="container">
        <div class="row d-flex align-items-center flex-wrap">
          <div class="col-md-7">
            <h1 class="h2">${cat.getName()}</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Category with left sidebar</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="content">
      <div class="container">
        <div class="row bar">
        
          <!-- Sidebar - Categories    ======== -->
		  <jsp:include page="../Sections/sidebar.jsp" flush="true"/>
          
          <div class="col-md-9">
            <div class="row products products-big">
            <c:forEach items="${listProducts}" var="prd">
	            <div class="col-lg-4 col-md-6">
	                <div class="product">
	                  <div class="image"><a href="product-detail?product_id=${prd.getId()}"><img src="productimages/${prd.getId()}/1.jpg" alt=""
	                        class="img-fluid image1"></a></div>
	                  <div class="text">
	                    <h3 class="h5"><a href="product-detail?product_id=${prd.getId()}">${prd.getName()}</a></h3>
	                    <p class="price"><strong>$ </strong>${prd.getPrice()}</p>
	                  </div>
	                </div>
	            </div>
            </c:forEach>
            <div class="pages">
              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                <ul class="pagination">
                	<li class="page-item"><a href="category?cat_id=${cat.getId()}&page=${currPageNumber - 1}" class="page-link"> <i class="fa fa-angle-double-left"></i></a></li>
	                <c:forEach items="${pages}" var="pageNumber">
	                	<c:if test="${pageNumber == currPageNumber}">
	                		<li class="page-item active"><a href="category?cat_id=${cat.getId()}&page=${pageNumber}" class="page-link">${pageNumber}</a></li>
	                	</c:if>
	                	<c:if test="${pageNumber != currPageNumber}">
	                		<li class="page-item"><a href="category?cat_id=${cat.getId()}&page=${pageNumber}" class="page-link">${pageNumber}</a></li>
	                	</c:if>
	                </c:forEach>
                	<li class="page-item"><a href="category?cat_id=${cat.getId()}&page=${currPageNumber + 1}" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- GET IT-->
    <div class="get-it">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 text-center p-3">
            <h3>Do you want cool website like this one?</h3>
          </div>
          <div class="col-lg-4 text-center p-3"> <a href="#" class="btn btn-template-outlined-white">Buy this template
              now</a></div>
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