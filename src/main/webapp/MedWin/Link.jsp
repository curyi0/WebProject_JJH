<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<tr>
	<!-- 로그인 여부에 따른 메뉴 변화 -->
	<% if (session.getAttribute("Id") == null) { %>
	<a href="로그인화면.jsp"></a>
	<% } 
        else { %>
	<a href="로그아웃.jsp"></a>
	<% } %>
	
	
	<!-- if(session.getAttribute("Id")!=null){
		
		
	}
  	else{
  		반갑습니다!=session.getAttribute("AKA")
	플레이어님-->
	
	<!--a hre="로그아웃.jsp"></a-->
	<%
 	 
  	%>
	<!--회원제 게시판 프로젝트에서 사용할 링크 -->

	<!-- a href="../mvcboard/list.do">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../mvcboard/listPage.do">게시판(페이징O)</a-->
</tr>

