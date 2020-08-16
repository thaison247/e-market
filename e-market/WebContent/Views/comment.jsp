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
  <div id="comments">
     <h4 class="text-uppercase">2 comments</h4>
     <div class="row comment">
       <div class="col-sm-3 col-md-2 text-center-xs">
         <p><img src="img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle"></p>
       </div>
       <div class="col-sm-9 col-md-10">
         <h5 class="text-uppercase">Julie Alma</h5>
         <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2011 at 12:00 am</p>
         <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
           Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit
           amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
         <div class="row comment mb-0">
           <div class="col-sm-3 col-md-2 text-center-xs">
             <p><img src="img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle"></p>
           </div>
           <div class="col-sm-9 col-md-10">
             <h5 class="text-uppercase">Julie Alma</h5>
             <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2011 at 12:00 am</p>
             <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
               Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero
               sit
               amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
           </div>
         </div>
         <div id="comment-form">
           <form name="inside-cmtfrm">
             <div class="row">
               <div class="col-sm-12">
                 <div class="form-group">
                   <textarea id="comment" rows="1" name="input_comment" class="form-control"></textarea>
                 </div>
               </div>
             </div>
             <div class="row">
               <div class="col-sm-12 text-right">
                 <button class="btn btn-sm btn-template-outlined" onClick=""><i class="fa fa-comment-o" ></i> Post
                   comment</button>
               </div>
             </div>
           </form>
         </div>
       </div>
     </div>
     
     <div id="comment-form">
       <h4 class="text-uppercase">Leave a comment</h4>
       <form  name="outside-cmtfrm">
         <div class="row">
           <div class="col-sm-12">
             <div class="form-group">
               <label for="comment">Comment <span class="required text-primary">*</span></label>
               <textarea id="comment" name="input_comment" rows="2" class="form-control"></textarea>
             </div>
           </div>
         </div>
         <div class="row">
           <div class="col-sm-12 text-right">
             <button class="btn btn-template-outlined" onClick=""><i class="fa fa-comment-o"></i> Post comment</button>
           </div>
         </div>
       </form>
     </div>
 </div>
	              
  <!-- Javascript files-->
  <jsp:include page="../Sections/js_files.jsp" flush="true"/>
</body>

</html>