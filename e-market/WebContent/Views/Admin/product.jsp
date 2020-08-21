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
    <title>User Management</title>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous">
    </script>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="index.html">E-MARKET</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">Settings</a>
                    <a class="dropdown-item" href="#">Activity Log</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="login.html">Logout</a>
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
                        <a class="nav-link " href="index.html">
                            <div class="sb-nav-link-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
                            User
                        </a>
                        <a class="nav-link active" href="charts.html">
                            <div class="sb-nav-link-icon"><i class="fa fa-list" aria-hidden="true"></i></div>
                            Product
                        </a>
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon"><i class="fa fa-shopping-bag" aria-hidden="true"></i></div>
                            Shop
                        </a>
                        <a class="nav-link" href="tables.html">
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
                    <h1 class="mt-4">Product Mangement</h1>
                    <form name="frm_user_search">
		                <div class="input-group">
		                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
		                    <div class="input-group-append">
		                        <button class="btn btn-primary" type="button"><svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg><!-- <i class="fas fa-search"></i> --></button>
		                    </div>
		                </div>
            		</form>
					
					<table class="table table-striped table-hover">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 10%">ID</th>
					      <th scope="col" style="width: 50%">Name</th>
					      <th scope="col" style="width: 20%">Date</th>
					      <th scope="col" style="width: 10%">Status</th>
					      <th scope="col" style="width: 10%">Seller ID</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${listProducts}" var="prd">
					  		<tr>
						      <th scope="row">${prd.getId()}</th>
						      <td><a href="product-detail?product_id=${prd.getId()}" target="_blank">${prd.getName()}</a></td>
						      <td>${prd.getDate()}</td>
						      <c:if test="${prd.isDeleted() == false}">
						      	<c:if test="${prd.isSold() == false }">
							      	<td class="table-success">Available</td>
							    </c:if>
							    <c:if test="${prd.isSold() == true }">
							      	<td class="table-warning">Sold</td>
							    </c:if>
						      </c:if>
						      <c:if test="${prd.isDeleted() == true}">
						      	<td class="table-danger">Deleted</td>
						      </c:if>
						      
						      <td><a href="profile?user_id=${prd.getSellerId()}" target="_blank">${prd.getSellerId()}</a></td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
                
                	<div class="row">
                		<div class="col-sm-12 col-md-5">
                			<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing ${from} to ${to} of ${total} products</div>
                		</div>
                		<div class="col-sm-12 col-md-7">
	                		<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
		                		<ul class="pagination" style="justify-content:flex-end;">
		                			<c:if test="${currPageNumber <= 1}">
		                				<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
		                			</c:if>
		                			<c:if test="${currPageNumber > 1}">
		                				<li class="paginate_button page-item previous" id="dataTable_previous"><a href="admin-product?page=${page-1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
		                			</c:if>
		                			<c:forEach items="${pages}" var="page">
		                				<c:if test="${currPageNumber == page}">
		                					<li class="paginate_button page-item active">
		                						<a href="admin-product?page=${page}" aria-controls="dataTable" data-dt-idx="${page}" tabindex="0" class="page-link">${page}</a>
		                					</li>
		                				</c:if>
		                				<c:if test="${currPageNumber != page}">
		                					<li class="paginate_button page-item">
		                						<a href="admin-product?page=${page}" aria-controls="dataTable" data-dt-idx="${page}" tabindex="0" class="page-link">${page}</a>
		                					</li>
		                				</c:if>
		                			</c:forEach>
		                			<c:if test="${currPageNumber >=  numberOfPages}">
		                				<li class="paginate_button page-item next disabled" id="dataTable_next"><a href="admin-product?page=${page+1}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
		                			</c:if>
		                			<c:if test="${currPageNumber <  numberOfPages}">
		                				<li class="paginate_button page-item next" id="dataTable_next"><a href="admin-product?page=${page+1}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
		                			</c:if>
									
		                		</ul>
	                		</div>
                		</div>
                	</div>
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