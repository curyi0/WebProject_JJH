<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
/*  session.removeAttribute("UserId");
session.removeAttribute("UserName");

*/ // || 위아래 둘중 한 코드만 존재하면 됨 
  session.invalidate();
  
  response.sendRedirect("./index.do");
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그 아웃</title>
</head>
<body>

</body>
</html>