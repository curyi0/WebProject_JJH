<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.sql.DataSource, java.sql.*, javax.naming.InitialContext, javax.naming.Context" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>회원등록 확인</title>
</head>
<body>
    
    <%
    request.setCharacterEncoding("UTF-8");
    
        // 회원가입 폼 데이터 가져오기
 		String ID= request.getParameter("Id");
    	String password = request.getParameter("pass");
        String name = request.getParameter("Name");
        String nickname = request.getParameter("aka");
        String jumin= request.getParameter("jumin");
        String phone = request.getParameter("Phone_Number");
        String addr = request.getParameter("Addr");
        String stat = request.getParameter("status");
        
        String email = request.getParameter("Email");
        
                     
        // 입력 데이터 유효성 검사
        if (name == null || name.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            email == null || email.trim().isEmpty()) {
            out.println("<script>alert(필수 항목을 모두 입력해야합니다.);</script>");
        } /*else {

            try {
                // DataSource를 통해 Connection Pool에서 연결 가져오기
                
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/MyDB");
 
                // SQL 쿼리 실행
                String sql = "INSERT INTO Players (name, id, pass, phonenum, AKA, JUMIN, addr, status) " 
                	       + " VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
                 pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, ID);
                pstmt.setString(3, password); // 실제로는 비밀번호를 해시 처리해야 보안에 안전합니다.
                pstmt.setString(4, phone);       
                pstmt.setString(5, nickname);
                pstmt.setString(6, jumin);
                pstmt.setString(7, addr);
                pstmt.setString(8, stat);
                if(email!=null){
            		pstmt.setString(9, email);
            	}

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    out.println("<p>회원가입이 성공적으로 완료되었습니다!</p>");
                } else {
                    out.println("<p>회원가입에 실패했습니다. 다시 시도해 주세요.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>오류가 발생했습니다: " + e.getMessage() + "</p>");
            } finally {
                // 연결 닫기 (Connection Pool로 반환)
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
	               out.println("예외가 발생했습니다.");
                    e.printStackTrace();
             
                }
            }
        }*/
    %>
</body>
</html>
