<%@page import="common.DBConnPool"%>
<%@page import="players.PlayerDTO"%>
<%@page import="players.PlayerDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DBConnPool pool = new DBConnPool();

//로그인 화면에서 전송한 폼값을 받는다..
String userId= request.getParameter("Id");
String userPwd= request.getParameter("pass");

PlayerDTO dto = new PlayerDTO();
dto.setId(userId);
dto.setPass(userPwd);

//DAO 인스턴스를 생성하면 커넥션풀을 통해 db에 연결된다. 
PlayerDAO dao = new PlayerDAO();
dto = dao.getPlayerlog(dto);


//DTo 객체에  아이디 저장되어 있으면 로그인 성공으로 판단
if(dto.getName() != null){
	//세션 영역에 아이디 이름 저장
	session.setAttribute("Id", dto.getId());
	session.setAttribute("name", dto.getName());
	session.setAttribute("AKA", dto.getAKA());
	
	System.out.println("로그인 성공");
	response.sendRedirect("index.jsp");
	request.getRequestDispatcher("index.do");	
	/*  세션영역에 저장된 속성값은 페이지를 이동하더라도 유지되므로 로그인페이지로 이동
	그리고  웹브라우저를 닫을때까지 저장된 정보 유지*/	
}
else {/*  로그인 실패의 경우에는 request영역에 에러메세지를 저장한 후 로그인 페이지로 포워드함
	request영역은 포워드한 페이지까지 영역공유*/
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("login.jsp").forward(request,response);
	//request.getRequestDispatcher("login.do");
	
	System.out.println("로그인 실패");
	//로그인 화면으로  혹은 로그 아웃
	
}
%>