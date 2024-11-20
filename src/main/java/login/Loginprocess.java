package login;

import java.io.IOException;

import common.DBConnPool;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import players.PlayerDAO;
import players.PlayerDTO;

@WebServlet("/Login.do")
public class Loginprocess extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("./Login.jsp").forward(req, resp); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 String pId= req.getParameter("Id");
	 String ppass=req.getParameter("pass");
	 
	 PlayerDTO dto= new PlayerDTO();
	 dto.setId(pId);
	 dto.setPass(ppass);
	 
	 PlayerDAO dao = new PlayerDAO();
	 dto = dao.getPlayerlog(dto);
	 
	 if(pId !=null || ppass!= null){
			//세션 영역에 아이디 이름 저장
		 	HttpSession session = req.getSession();
	        session.setAttribute("Id", dto.getId());
	        session.setAttribute("name", dto.getName());
	        session.setAttribute("AKA", dto.getAKA());
	        resp.sendRedirect("./index.jsp");
//			req.setAttribute("Id", dto.getId());
//			req.setAttribute("name", dto.getName());
//			req.setAttribute("AKA", dto.getAKA());
			
			System.out.println("로그인 성공");
			
	}
	 else {
		 	System.out.println("로그인실패..");
		 	req.getRequestDispatcher("./index.jsp").forward(req, resp);
	 }
	}
}
