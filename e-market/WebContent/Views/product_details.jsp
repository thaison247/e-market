<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${product.getName()}</title>
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
            <h1 class="h2">Product details</h1>
          </div>
          <div class="col-md-5">
            <ul class="breadcrumb d-flex justify-content-end">
             <!--  <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Portfolio - 4 columns</li> -->
            </ul>
          </div>
        </div>
      </div>
    </div>
          <div id="content">
        <div class="container">
          <div class="row bar" style="padding: 30px 0;">
            <!-- LEFT COLUMN _________________________________________________________-->
            <div class="col-lg-12">
              <h4>${product.getName()}</h4>
              <p class="lead" style="margin-bottom: 10px;">${product.getShortDesc()}</p>
              <p class="goToDescription" style="margin-bottom: 10px;"><a href="#details" class="scroll-to text-uppercase">Scroll to product details, material & care and sizing</a></p>
              <div id="productMain" class="row">
                <div class="col-sm-6">
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                    <div> <img src="productimages/${product.getId()}/1.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="productimages/${product.getId()}/2.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="productimages/${product.getId()}/3.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="productimages/${product.getId()}/4.jpg" alt="" class="img-fluid"></div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="box" style="margin: 0px 0;">
                    <form action="add-to-wishlist" method="post">
                      <div class="sizes" style="text-align: left;">
                        <h3>${product.getName()}</h3>
                      </div>
                      <div class="sizes" style="text-align: left;">
                        <h5 style="margin-bottom: 5px;">Seller: <a href="profile?user_id=${seller.getId()}">${seller.getName()}</a></h5>
                        <p class="lead" style="margin-bottom: 5px; font-size: 1rem;"><strong>Address: </strong>${seller.getAddress()}</p>
                        <p class="lead" style="margin-bottom: 5px; font-size: 1rem;"><strong>Phone: </strong>${seller.getPhone()}</p>
                        <p class="lead" style="margin-bottom: 5px; font-size: 1rem;"><strong>Email: </strong>${seller.getEmail()}</p>
                      </div>
                      <p class="price" style="text-align: left;"><strong style="color: red; font-size: 30pt;">$</strong>${product.getPrice()}</p>
                      <input type="hidden" name="product_id" value="${product.getId()}">
                      <input type="hidden" name="user_id" value="${sessionScope.user.getId()}">
                      <p>
                      	<c:if test="${sessionScope.isAuthenticated == true}">
                      		<c:if test="${inUserWishlist == true}">
                      			<a href="wishlist?user_id=${sessionScope.user.getId()}">
                      				<button  type="button" class="btn btn-warning"><i class="fa fa-heart" aria-hidden="true"></i> in your wishlist</button>
                      			</a>
                      		</c:if>
                      		<c:if test="${inUserWishlist == false}">
                      			<button type="submit" class="btn btn-template-outlined"><i class="fa fa-heart" aria-hidden="true"></i> Add to wishlist</button>
                      		</c:if>
                      	</c:if>
                      	<c:if test="${product.isSold() == true}">
                      		<button type="button" class="btn btn-danger">THIS PRODUCT IS SOLD</button>
                      	</c:if>
                      </p>
                    </form>
                  </div>
                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/1.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/2.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/3.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="productimages/${product.getId()}/4.jpg" alt="" class="img-fluid"></button>
                  </div>
                </div>
              </div>
	            <ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
	              
	              	<c:if test="${showComment == false}">
	              		<li id="details" class="nav-item">
			              	<a id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			                  aria-controls="pills-home" aria-selected="false" class="nav-link active">Detail Description</a>
			            </li>
		                <li class="nav-item">
		                	<a id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab"
		                    aria-controls="pills-profile" aria-selected="true" class="nav-link ">Comments</a>
		                </li>
	              	</c:if>
	              	<c:if test="${showComment == true}">
	              		<li id="details" class="nav-item">
			              	<a id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			                  aria-controls="pills-home" aria-selected="false" class="nav-link ">Detail Description</a>
			            </li>
		                <li class="nav-item">
		                	<a id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab"
		                    aria-controls="pills-profile" aria-selected="true" class="nav-link active">Comments</a>
		                </li>
	              	</c:if>
              	  <!-- <li id="details" class="nav-item">
	              	<a id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
	                  aria-controls="pills-home" aria-selected="false" class="nav-link active">Detail Description</a>
	              </li>
	              <li class="nav-item"><a id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab"
	                  aria-controls="pills-profile" aria-selected="true" class="nav-link ">Comments</a></li> -->
	            </ul>
	            <div id="pills-tabContent" style="background: azure;" class="tab-content">
	            <c:if test="${showComment == false}">
	            	<div id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" class="tab-pane fade active show">
		                <div id="details" class="box mb-4 mt-4">
						    <p></p>
						    <h4>Product details</h4>
						    ${product.getDetailDesc()}
						</div>
		              </div>
		              <div id="pills-profile" style="background: azure;" role="tabpanel" aria-labelledby="pills-profile-tab" class="tab-pane fade">
			              <div id="comments">
				              <h4 class="text-uppercase">${listComments.size()} comments</h4>
				              <c:forEach items="${listComments}" var="cmt">
				              	<c:if test="${cmt.rootId == 0}">
				              		<div class="row comment">
						                <div class="col-sm-1 col-md-1 col-1 text-center-xs">
							                <c:if test="${cmt.getUser().getId() == product.getSellerId()}">
							                	<p><img src="img/seller.jpg" alt="" class="img-fluid rounded-circle"></p>
							                </c:if>
							                <c:if test="${cmt.getUser().getId() != product.getSellerId()}">
							                	<p><img src="img/user.png" alt="" class="img-fluid rounded-circle"></p>
							                </c:if>
						                </div>
						                <div class="col-sm-11 col-md-11">
						                  <h5 class="text-uppercase"style="margin-bottom: 0;"><a href="profile?user_id=${cmt.getUser().getId()}">${cmt.getUser().getName()}</a></h5>
						                  <p class="posted" style="color: yellowgreen"><i class="fa fa-clock-o"></i> ${cmt.getTime()}</p>
						                  <p style="border-bottom: #bec8dcborder-width: thin; border-style: ridge;border-right: none;border-top: none;border-left: none;">${cmt.getContent()}</p>
						                  
						                  <c:forEach items="${listComments}" var="cmt2">
						                  	
						                  		<c:if test="${cmt2.rootId == cmt.getId()}">
						                  		
						                  			<div class="row comment mb-0">
									                    <div class="col-sm-1 col-md-1 col-1 text-center-xs">
									                      <c:if test="${cmt2.getUser().getId() == product.getSellerId()}">
											                	<p><img src="img/seller.jpg" alt="" class="img-fluid rounded-circle"></p>
											                </c:if>
											                <c:if test="${cmt2.getUser().getId() != product.getSellerId()}">
											                	<p><img src="img/user.png" alt="" class="img-fluid rounded-circle"></p>
											                </c:if>
									                    </div>
									                    <div class="col-sm-11 col-md-11">
									                      <h5 class="text-uppercase" style="margin-bottom: 0;"><a href="profile?user_id=${cmt2.getUser().getId()}">${cmt2.getUser().getName()}</a></h5>
									                      <p class="posted" style="color: yellowgreen"><i class="fa fa-clock-o"></i>${cmt2.getTime()}</p>
									                      <p style="border-bottom: #bec8dcborder-width: thin; border-style: ridge;border-right: none;border-top: none;border-left: none;">${cmt2.getContent()}</p>
								                    	</div>
						                  			</div>
						                  		
						                  		</c:if>
						                  
						                  </c:forEach>
						                  <c:if test="${sessionScope.user != null}">
							                  <div id="comment-form">
							                    <form action="comment" method="POST" name="inside-cmtfrm">
							                    	<input name="user_id" type="hidden" value="${sessionScope.user.getId()}">
				                      				<input name="root_id" type="hidden" value="${cmt.getId()}">
				                      				<input name="product_id" type="hidden" value="${product.getId()}">
							                      <div class="row">
							                        <div class="col-sm-12">
							                          <div class="form-group">
							                            <textarea name="content" style="border-left:white;border-right:white;border-top:white;" rows="1" class="form-control" placeholder="Reply ${cmt.getUser().getName()}'s comment ..."></textarea>
							                          </div>
							                        </div>
							                      </div>
							                      <div class="row">
							                        <div class="col-sm-12 text-right">
							                          <button class="btn btn-sm btn-template-outlined" type="submit"><i class="fa fa-comment-o" ></i> Post
							                            comment</button>
							                        </div>
							                      </div>
							                    </form>
							                  </div>
						                  </c:if>
				                		</div>
				              		</div>
				              	</c:if>
				              </c:forEach>
				              <c:if test="${sessionScope.user != null}">
					              <div id="comment-form">
					                <h4 class="text-uppercase">Leave a comment</h4>
					                <form action="comment" method="POST" name="outside-cmtfrm">
					                  <input name="user_id" type="hidden" value="${sessionScope.user.getId()}">
				                      <input name="root_id" type="hidden" value="0">
				                      <input name="product_id" type="hidden" value="${product.getId()}">
					                  <div class="row">
					                    <div class="col-sm-12">
					                      <div class="form-group">
					                        <label for="content">Your Comment<span class="required text-primary"></span></label>
					                        <textarea id="content" name="content" rows="2" class="form-control" placeholder="Type your comment here ..."></textarea>
					                      </div>
					                    </div>
					                  </div>
					                  <div class="row">
					                    <div class="col-sm-12 text-right">
					                      <button type="submit" class="btn btn-template-outlined"><i class="fa fa-comment-o"></i> Post comment</button>
					                    </div>
					                  </div>
					                </form>
					              </div>
				              </c:if>
				          </div>
		              
		              </div>
	            </c:if>
	            <c:if test="${showComment == true}">
	            	<div id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" class="tab-pane fade">
		                <div id="details" class="box mb-4 mt-4">
						    <p></p>
						    <h4>Product details</h4>
						    ${product.getDetailDesc()}
						</div>
		              </div>
		              <div id="pills-profile" style="background: azure;" role="tabpanel" aria-labelledby="pills-profile-tab" class="tab-pane fade active show">
			              <div id="comments">
				              <h4 class="text-uppercase">${listComments.size()} comments</h4>
				              <c:forEach items="${listComments}" var="cmt">
				              	<c:if test="${cmt.rootId == 0}">
				              		<div class="row comment">
						                <div class="col-sm-1 col-md-1 col-1 text-center-xs">
							                <c:if test="${cmt.getUser().getId() == product.getSellerId()}">
							                	<p><img src="img/seller.jpg" alt="" class="img-fluid rounded-circle"></p>
							                </c:if>
							                <c:if test="${cmt.getUser().getId() != product.getSellerId()}">
							                	<p><img src="img/user.png" alt="" class="img-fluid rounded-circle"></p>
							                </c:if>
						                </div>
						                <div class="col-sm-11 col-md-11">
						                  <h5 class="text-uppercase"style="margin-bottom: 0;"><a href="profile?user_id=${cmt.getUser().getId()}">${cmt.getUser().getName()}</a></h5>
						                  <p class="posted" style="color: yellowgreen"><i class="fa fa-clock-o"></i> ${cmt.getTime()}</p>
						                  <p style="border-bottom: #bec8dcborder-width: thin; border-style: ridge;border-right: none;border-top: none;border-left: none;">${cmt.getContent()}</p>
						                  
						                  <c:forEach items="${listComments}" var="cmt2">
						                  	
						                  		<c:if test="${cmt2.rootId == cmt.getId()}">
						                  		
						                  			<div class="row comment mb-0">
									                    <div class="col-sm-1 col-md-1 col-1 text-center-xs">
									                      <c:if test="${cmt2.getUser().getId() == product.getSellerId()}">
											                	<p><img src="img/seller.jpg" alt="" class="img-fluid rounded-circle"></p>
											                </c:if>
											                <c:if test="${cmt2.getUser().getId() != product.getSellerId()}">
											                	<p><img src="img/user.png" alt="" class="img-fluid rounded-circle"></p>
											                </c:if>
									                    </div>
									                    <div class="col-sm-11 col-md-11">
									                      <h5 class="text-uppercase" style="margin-bottom: 0;"><a href="profile?user_id=${cmt2.getUser().getId()}">${cmt2.getUser().getName()}</a></h5>
									                      <p class="posted" style="color: yellowgreen"><i class="fa fa-clock-o"></i>${cmt2.getTime()}</p>
									                      <p style="border-bottom: #bec8dcborder-width: thin; border-style: ridge;border-right: none;border-top: none;border-left: none;">${cmt2.getContent()}</p>
								                    	</div>
						                  			</div>
						                  		
						                  		</c:if>
						                  
						                  </c:forEach>
						                  
						                  <div id="comment-form">
						                    <form action="comment" method="POST" name="inside-cmtfrm">
						                    	<input name="user_id" type="hidden" value="${sessionScope.user.getId()}">
			                      				<input name="root_id" type="hidden" value="${cmt.getId()}">
			                      				<input name="product_id" type="hidden" value="${product.getId()}">
						                      <div class="row">
						                        <div class="col-sm-12">
						                          <div class="form-group">
						                            <textarea name="content" style="border-left:white;border-right:white;border-top:white;" rows="1" class="form-control" placeholder="Reply ${cmt.getUser().getName()}'s comment ..."></textarea>
						                          </div>
						                        </div>
						                      </div>
						                      <div class="row">
						                        <div class="col-sm-12 text-right">
						                          <button class="btn btn-sm btn-template-outlined" type="submit"><i class="fa fa-comment-o" ></i> Post
						                            comment</button>
						                        </div>
						                      </div>
						                    </form>
						                  </div>
				                		</div>
				              		</div>
				              	</c:if>
				              </c:forEach>
				              <div id="comment-form">
				                <h4 class="text-uppercase">Leave a comment</h4>
				                <form action="comment" method="POST" name="outside-cmtfrm">
				                  <input name="user_id" type="hidden" value="${sessionScope.user.getId()}">
			                      <input name="root_id" type="hidden" value="0">
			                      <input name="product_id" type="hidden" value="${product.getId()}">
				                  <div class="row">
				                    <div class="col-sm-12">
				                      <div class="form-group">
				                        <label for="content">Your Comment<span class="required text-primary"></span></label>
				                        <textarea id="content" name="content" rows="2" class="form-control" placeholder="Type your comment here ..."></textarea>
				                      </div>
				                    </div>
				                  </div>
				                  <div class="row">
				                    <div class="col-sm-12 text-right">
				                      <button type="submit" class="btn btn-template-outlined"><i class="fa fa-comment-o"></i> Post comment</button>
				                    </div>
				                  </div>
				                </form>
				              </div>
				          </div>
		              
		              </div>
	            </c:if>
	            </div>
              
              <div id="product-social" class="box social text-center mb-5 mt-5">
                <h4 class="heading-light">Show it to your friends</h4>
                <ul class="social list-inline">
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="box text-uppercase mt-0 mb-small">
                    <h3>You may also like these products</h3>
                  </div>
                </div>
                <c:forEach  items="${listRelativeProducts}" var="prd">
	                <div class="col-lg-3 col-md-6">
	                  <div class="product">
	                    <div class="image"><a href="product-detail?product_id=${prd.getId()}"><img src="productimages/${prd.getId()}/1.jpg" alt="" class="img-fluid image1"></a></div>
	                    <div class="text">
	                      <h3 class="h5"><a style=" text-overflow: ellipsis; overflow: hidden; width: 250px;"  href="product-detail?product_id=${prd.getId()}">${prd.getName()}</a></h3>
	                      <p class="price">$ ${prd.getPrice()}</p>
	                    </div>
	                  </div>
	                </div>
                </c:forEach>
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
  </div>
  
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>