<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>회원가입페이지</title>
      <meta name="keywords" content="">
    
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700|Poppins:400,700&display=swap" rel="stylesheet">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
   </head>
   <body>
   <h2></h2>
      <!-- header top section start -->
      <div class="header_top_section">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="header_top_main">
                     <div class="call_text"><a href="#"><span class="padding_right0"><i class="fa fa-phone" aria-hidden="true"></i></span>문의번호 : +01 1234567890</a></div>
                     <div class="call_text_2"><a href="#"><span class="padding_right0"><i class="fa fa-envelope" aria-hidden="true"></i></span> demo@gmail.com</a></div>
                     <div class="call_text_1"><a href="#"><span class="padding_right0"><i class="fa fa-map-marker" aria-hidden="true"></i></span> Location</a></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- header top section end -->
      
      <!-- header section start -->
      <div class="header_section">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand" href="index.jsp"><img src="images/pixlogo.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="about.do">About</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="FreeBoard.do">자유게시판</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="QABoard.do">Q&A</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="blog.do">자료실</a>
                     </li>                     
                  </ul>
                                 
               </div>
            </nav>
            <div class="custom_bg">
               <div class="custom_menu">
                  <ul>
                     <li class="active"><a href="index.jsp">Home</a></li>
                     <li><a href="about.do">About</a></li>
                     <li><a href="treatment.do">자유게시판</a></li>
                     <li><a href="doctors.do">Q&A</a></li>
                     <li><a href="blog.do">자료실</a></li>
                     <li><a href="contact.do"> Us</a></li>
                  </ul>
               </div>
               
               <form class="form-inline my-2 my-lg-0">
                  <div class="search_btn">
                     <li><a href="Login.jsp"><i class="fa fa-user" aria-hidden="true"></i>
                     <span class="signup_text">Login</span></a></li>
                     <li><a href="signup.jsp"><i class="fa fa-user" aria-hidden="true"></i>
                     <span class="signup_text">Sign Up</span></a></li>
                     <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- header section end -->
      <!-- signup section start -->
      <div class="contact_section layout_padding">
      
         <div class="container-fluid">
            <div class="contact_section_2">
               <div class="row">
               <p align="center"></p>
                  <!-- div class="col-md-6"-->
                     <h1 class="contact_taital">회원가입<br/>
                     <strong style="text-indent: 30px;"> 본 게임은 </strong><img src="data:image/png;base64,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" 
                     width=50px heigh=10px></h1>
                     <form action="signupCheck.do" method="post">
                        <!-- div class="signup_context"-->
                        	*이름 <br/>
                           <p><input type="text" class="text" placeholder="이름" name="Name"><br/></p>
                            *아이디<br/>
                           <p><input type="text" class="text" placeholder="아이디" name="Id"><br/></p>
                           *비밀번호 <br/>
                           <p><input type="text" class="text" placeholder="비밀번호" name="pass"><br/></p>    
                           <p><input type="text" class="text" placeholder="비밀번호 확인" name="passCheck"><br/></p><!-- 비밀번호를 한번더 입력해주세요-->
                           
                            닉네임 <br/>
                           <p><input type="text" class="text" placeholder="NickName" name="AKA"><br/></p>
                           *주민번호<br/>
                           <input type="text" class="text" placeholder="앞자리" name="jumin1">-
                           <input type="text" class="text" placeholder="뒷자리" name="jumin2"><br/>
                           *전화번호(-없이)
                           <p><input type="text" class="text" placeholder="전화번호" name="Phone_Number"><br/></p>
                           이메일<br/>
                           <p><input type="text" class="text" placeholder="이메일" name="Email"><br/></p>
                           *주소<br/>
                           <p><input type="text" class="text" placeholder="주소" name="Address"> </p>
                           &nbsp;
                        
                           <input type="button"  value="가입하기" class="send_bt"><a href="index.do"></a>
                           <!-- onclick="window.location.href=''../index.do'"-->           
                           </div><!-- 조건문추가-->
                       
                        </div>
                     </form>
                  </div>
                  <script language="javascript" >
                  function signUpCheck() {
					var idcheck= document.getElementById("Id");
					var passcheck= document.getElementById("pass");
					var repasscheck= document.getElementById("passCheck");
					var namecheck= document.getElementById("Name");
					var nickcheck= document.getElementById("AKA");
					var emailcheck= document.getElementById("Email");
					var addresscheck= document.getElementById("Address");
					
					var jumin1check= document.getElementById("jumin1");
					var jumin2check= document.getElementById("jumin2");
					var jumins3 = jumins1.value + jumins2.value;//1과 2를 합친곳
				}
                  
                  </script>
                  
                   <!-- 구글맵?-->
                  <div class="col-md-6 padding_left_15">
                     <div class="map_main">
                        <div class="map-responsive">
                           <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&amp;q=Eiffel+Tower+Paris+France" width="600" height="600" frameborder="0" style="border:0; width: 100%;" allowfullscreen=""></iframe>
                        </div> </div></div>
   



      <!-- footer section start (하단 view)-->
      <div class="footer_section">
         <div class="container">
            <div class="input_bt">
               <input type="text" class="mail_bt" placeholder="Enter Your Email" name="Enter your email">
               <span class="subscribe_bt" id="basic-addon2"><a href="#">Subscribe</a></span>
            </div>
            <div class="footer_section_2">
               <div class="row">
                  <div class="col-lg-3 col-sm-6">
                     <h3 class="footer_taital">Address</h3>
                     <div class="location_main">
                        <ul>
                           <li>
                              <a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i>
                              <span class="padding_15">Making this the first true</span></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-phone" aria-hidden="true"></i>
                              <span class="padding_15">문의번호 : +01 1234567890</span></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>
                              <span class="padding_15">Email : demo@gmail.com</span></a>
                           </li>
                        </ul>
                     </div>
                     <div class="footer_social_icon">
                        <ul>
                           <li>
                              <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                           <li>
                              <a href="https://x.com/"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                           <li>
                              <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                           <li>
                              <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <h3 class="footer_taital">Useful Link</h3>
                     <div class="footer_menu">
                        <ul>
                           <li>
                              <a href="index.do">Home</a>
                           </li>
                           <li>
                              <a href="about.do">About</a>
                           </li>
                           <li>
                              <a href="doctors.do">Doctors</a>
                           </li>
                           <li>
                              <a href="news.do">News</a>
                           </li>
                           <li>
                              <a href="treatment.do">Treatment</a>
                           </li>
                           <li class="active">
                              <a href="contact.do">Contact Us</a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <h3 class="footer_taital">Help & Support</h3>
                     <p class="ipsum_text">Opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page</p>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                     <h3 class="footer_taital">News</h3>
                     <div class="dryfood_text"><img src="images/img-4.png"><span class="padding_15">Normal distribution</span></div>
                     <div class="dryfood_text"><img src="images/img-5.png"><span class="padding_15">Normal distribution</span></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">2024 All Rights Reserved. Design by <a href="https://html.design">Free Html Templates</a> Distribution By <a href="https://themewagon.com">ThemWagons</a></p>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>  
      <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
      <script>
         $('#datepicker').datepicker({
             uiLibrary: 'bootstrap'
         });
      </script> 
      <script>
         $('#timepicker').timepicker({
             uiLibrary: 'bootstrap'
         });
      </script>
   </body>
</html>