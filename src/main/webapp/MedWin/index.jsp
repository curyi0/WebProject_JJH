<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--taglib prefix="c" uri="jakarta.tags.core" -->
<!DOCTYPE html>
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
      <title>홈페이지 화면</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
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
   
      <!-- header top section start -->
      <div class="header_top_section">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="header_top_main">
                     <div class="call_text"><a href="#"><span class="padding_right0"><i class="fa fa-phone" aria-hidden="true"></i></span>  Call : +01 1234567890</a></div>
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
               <a class="navbar-brand"href="./index.do"><img src="images/pixlogo.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
               aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent"><!-- 토글메뉴-->
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a class="nav-link" href="index.do">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="./FreeBoard.do">자유게시판</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="./QABoard.do">Q&A</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="./History.do">자료실</a>
                     </li>                 
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                  </form>
               </div>
            </nav>
            <div class="custom_bg">
               <div class="custom_menu">
                  <ul>
                     
                     <li><a href="./about.do">About</a></li>
                     <li><a href="./FreeBoard.do">자유게시판</a></li>
                     <li><a href="./QABoard.do">Q&A</a></li>
                     <li><a href="./History.do">자료실</a></li>
                  </ul>
               </div>
	
               <!--  로그인, 회원가입 홈페이지 내 버튼 , 로그인시엔 로그아웃버튼으로 변경-->
               <form class="form-inline my-2 my-lg-0">
               <%
				// session영역에 저장된 속성이 없다면
				//'logout' 상태,, 로그인 form을 웹브라우저에 출력해야 함
				if (session.getAttribute("Id") != null) {%> <!--  로그인상태면 -->
					<%=session.getAttribute("AKA")%> 
					님 안녕하세요.&nbsp;
					<a href="./signEdit.do"> 내 정보 수정하기</a> 
					<a href="Logout.jsp"><i class="fa fa-user" aria-hidden="true"></i>
                     <span class="signup_text">Logout</span></a>
                     <% }else{ %>                   	
                     <a href="./Login.do"><i class="fa fa-user" aria-hidden="true"></i>
                     <span class="signup_text">Login</span></a>
                     <a href="./signup.do"><i class="fa fa-user" aria-hidden="true"></i>
                     <span class="signup_text">Sign Up</span></a>   
                   <% }%>
                  <div class="search_btn">
                     <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                     <button class="btn btn-sm btn-outline-secondary" type="submit">Search</button>
                      </div>   
                       </form>
            </div>
         </div>
         <!-- header section end -->
         <!-- banner section start --> 
         <div class="banner_section layout_padding">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                   <!-- 홈페이지입장문구-->  <h1 class="banner_taital">xxGames here</h1>
                     <p class="banner_text"> The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters </p>
                     <div class="read_bt" onclick= ><a href="#">Read More</a></div>
                  </div>
               </div>
            </div>
         </div>
         <!-- banner section end -->
      </div>
      
                  <h1 class="about_taital">About Hospital</h1>       

      <!-- doctores section start -->
      <div class="doctores_section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="doctores_taital">Our doctores</h1>
               </div>
            </div>
            
               <div id="my_slider" class="carousel slide" data-ride="carousel">
                  
                     <div class="carousel-item active">
                        <div class="row">

                                    <ul>
                                       <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                       <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                       <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                       <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-4"> </div>
                           <div class="col-md-4">    </div>
                         
                        </div>
                    
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-md-4">  </div>
                           <div class="col-md-4">       </div>
                           
                           <div class="col-md-4"><!--sns 아이콘-->                   
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-md-4">     </div>
                           </div>
                           <div class="col-md-4">   </div>
                           <div class="col-md-4">
                            </div>
                        </div>
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
                  <i class="fa fa-angle-left"></i>
                  </a>
                  <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
                  <i class="fa fa-angle-right"></i>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <!-- doctores 페이지 end -->
      
      <!-- testimonial section start -->
      <div class="testimonial_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="testimonial_taital">Our Testimonial</h1>
               </div>
            </div>
            
         </div>
      </div>
      <!-- testimonial section end -->
                      
                  <div class="col-md-6 padding_left_1">
                     <div class="map_main"><!--구글 지도 왜있는진 모름 지네 위치 표시 -->
                        <div class="map-responsive">
                           <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&amp;q=Eiffel+Tower+Paris+France" 
                           width="600" height="600" frameborder="0" style="border:0; width: 100%;" allowfullscreen=""></iframe>
                        </div>
                     </div>
                  </div>
                  
      <!-- footer(하단  꾸미기 영역)section start -->
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
                              <span class="padding_15">서울시 구구 감동</span></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-phone" aria-hidden="true"></i>
                              <span class="padding_15">문의번호: +01 1234567890</span></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>
                              <span class="padding_15">Email : demo@gmail.com</span></a>
                           </li>
                        </ul>
                     </div>
                     
                     <div class="footer_social_icon">
                        <ul><!-- sns 연동 필요 없을 듯 간지용-->
                           <li>
                              <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                           </li>
                           <li>
                              <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                           </li>
                        </ul>
                     </div>      
                  </div>
                  
                  <div class="col-lg-3 col-sm-6">
                     <h3 class="footer_taital">Useful Link</h3>
                     <div class="footer_menu">
                        <ul>
                           <li class="active">
                              <a href="./index.do">Home</a>
                           </li>
                           <li>
                              <a href="#">About</a>
                           </li>
                           <li>
                              <a href="./QABoard.do">Q&A</a>
                           </li>
                           <li>
                              <a href="./FreeBoard.do">FreeBoard</a>
                           </li>                         
                           <li>
                              <a href="./History.do">자료실</a>
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