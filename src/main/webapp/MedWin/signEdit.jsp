<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700|Poppins:400,700&display=swap"
	rel="stylesheet">
<!-- owl stylesheets -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
	<style>.links a:hover {
        text-decoration: underline;
      }
   <!-- 비밀번호 보기 css -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

   <!-- 비밀번호 눈표시 -->
   <style>
       .input-group.password {
           position: relative;
       }
    .input-group.password .eyes {
           position: absolute;
           top: 0;
           bottom: 0;
           right: 10px;
           margin: auto;
           height: 30px;
           font-size: 22px;
           cursor: pointer;
           display: flex;
           align-items: center;
       }</style>
</head>
<body>
	<h2></h2>
	<!-- header top section start -->
	<div class="header_top_section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="header_top_main">
						<div class="call_text">
							<a href="#"><span class="padding_right0"><i
									class="fa fa-phone" aria-hidden="true"></i></span>문의번호 : +01
								1234567890</a>
						</div>
						<div class="call_text_2">
							<a href="#"><span class="padding_right0"><i
									class="fa fa-envelope" aria-hidden="true"></i></span> demo@gmail.com</a>
						</div>
						<div class="call_text_1">
							<a href="#"><span class="padding_right0"><i
									class="fa fa-map-marker" aria-hidden="true"></i></span> Location</a>
						</div>
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
				<a class="navbar-brand" href="index.do"><img
					src="images/pixlogo.png"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<!-- 모바일 모드에서 토글버튼안에 들어있는 메뉴-->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="./index.do">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about.do">About</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="./FreeBoard.do">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="./QABoard.do">Q&A</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="./History.do">자료실</a>
						</li>
					</ul>

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

				<form class="form-inline my-2 my-lg-0">
				<%
				// session영역에 저장된 속성이 없다면
				//'logout' 상태,, 로그인 form을 웹브라우저에 출력해야 함
				if (session.getAttribute("Id") != null) {
				%>
				<!--  로그인상태면 -->
				<%=session.getAttribute("AKA")%>
				님 안녕하세요.&nbsp; <a href="./signEdit.do"> 내 정보 수정하기</a> <a
					href="Logout.jsp"><i class="fa fa-user" aria-hidden="true"></i>
					<span class="signup_text">Logout</span></a>
				<%
				} else {
				%>
				<a href="./Login.do"><i class="fa fa-user" aria-hidden="true"></i>
					<span class="signup_text">Login</span></a> <a href="./signup.do"><i
					class="fa fa-user" aria-hidden="true"></i> <span
					class="signup_text">Sign Up</span></a>
				<%
				}
				%>
				<div class="search_btn">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-sm btn-outline-secondary" type="submit">Search</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	<!-- header section end -->
	<!-- signup section start -->
	<div class="contact_section layout_padding">

		<div class="container-fluid">
			
				<div class="row">
					<p align="center"></p>
					<!-- div class="col-md-6"-->
					<h1 class="contact_taital"></h1>
						내 정보 수정하기<br><br>

						<form action="./signup.do" method="post">
							<!-- div class="signup_context"-->
							*이름 <br />
							<p>
								<input type="text" class="text" placeholder="수정할이름" name="Name"><br />
							</p>
							*아이디<br />
							<p>
								<input type="text" class="text" placeholder="수정할아이디" name="Id"><br />
							</p>
							*비밀번호 <br />
							<p>
								<input type="text" class="text" placeholder="비밀번호" name="pass"><br />
							</p>
							<p>
								<input type="text" class="text" placeholder="비밀번호 확인"
									name="passCheck"><br />
							</p>
							<!-- 비밀번호를 한번더 입력해주세요-->

							닉네임 <br />
							<p>
								<input type="text" class="text" placeholder="수정할닉네임"
									name="AKA"><br />
							</p>
							*주민번호<br /><p> <input type="text" class="text" placeholder="앞자리"
								name="jumin1" maxlength="6">- <input type="text"
								class="text" placeholder="뒷자리" name="jumin2" maxlength="7">
							<div class="eyes">
								<i class="fa fa-eye fa-lg"></i></div>
								<br />
								<div class="form-group">
									<div class="input-group mb-4 password"></div>
								</div></p>
							
							*전화번호(-없이)
							<p>
								<input type="text" class="text" placeholder="수정할전화번호"
									name="Phone_Number" maxlength="11"><br />
							</p>
							이메일<br />
							<p>
								<input type="text" class="text" placeholder="수정할이메일" name="Email"><br />
							</p>
							*주소<br />
							<p>
								<input type="text" class="text" placeholder="수정할주소" name="Address">
							</p><div>
							&nbsp; <input type="button" value="수정완료" class="send_bt" />
							&nbsp; <input type="button" value="초기화" class="reset" />
							</div>
							<!-- a href="./signup.do"></a-->

						</form>
</body>
</html>