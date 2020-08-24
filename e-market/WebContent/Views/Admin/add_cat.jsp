<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Add Category</title>
     <!-- Font Awesome CSS-->
  <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link href="css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous">
    </script> -->
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="admin-user">E-MARKET</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fa fa-bars" aria-hidden="true"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li style="color: white; margin-top: 5px">${sessionScope.ad.getName()}</li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout?from=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}">Logout</a>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Management</div>
                        <a class="nav-link " href="admin-user">
                            <div class="sb-nav-link-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
                            User
                        </a>
                        <a class="nav-link" href="admin-product">
                            <div class="sb-nav-link-icon"><i class="fa fa-list" aria-hidden="true"></i></div>
                            Product
                        </a>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts"
                            aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fa fa-columns" aria-hidden="true"></i></div>
                            Shop
                            <div class="sb-sidenav-collapse-arrow"><i class="fa fa-angle-down" aria-hidden="true"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="admin-shop">Shop management</a>
                                <a class="nav-link" href="admin-shop-request">Pending request</a>
                            </nav>
                        </div>
                        <a class="nav-link active" href="admin-category">
                            <div class="sb-nav-link-icon"><i class="fa fa-list-alt" aria-hidden="true"></i></div>
                            Category
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">Add Category</h1>
					
					<form action="admin-category-add" method="post" enctype="multipart/form-data">
					  <div class="form-group">
					    <label for="cat_name">Category Name</label>
					    <input name="cat_name" class="form-control" id="cat_name" placeholder="Type category's name . . .">
					  </div>
					  <div class="form-group" >
					    <label for="root_id">Select Root Category</label>
					    <select name="root_id" class="form-control" id="root_id">
				    		<option selected value = "0">None</option>
					    	<c:forEach items="${listCategoriesLv1}" var="cat">
					    		<option value="${cat.getId()}">${cat.getName()}</option>
					    	</c:forEach>
					    </select>
					  </div>
					  <label for="input_images">Upload banner for category</label>
					  <div class="custom-file">
						  <input id="input_images" name="input_images" accept="image/*" type="file"
													multiple="multiple" class="custom-file-input">
						  <label class="custom-file-label" for="input_images">Choose photos</label>
				  	  </div>
				  	  <div class="form-group ">
				  	  	<button type="submit" class="btn btn-primary mt-3">Submit</button>
				  	  </div>
					</form>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2020</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous">
    </script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>
</body>

</html>