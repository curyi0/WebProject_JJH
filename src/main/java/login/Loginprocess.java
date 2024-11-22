package login;

import java.io.IOException;
import java.io.PrintWriter;
import common.DBConnPool;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import players.PlayerDAO;
import players.PlayerDTO;
import utils.JSFunction;

@WebServlet("/MedWin/Login.do")
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
		 String aka= req.getParameter("AKA");
		 
		 System.out.println(pId);
		 System.out.println(ppass);
		 System.out.println(aka);
		 
		 PlayerDTO dto= new PlayerDTO();
		 dto.setId(pId);
		 dto.setPass(ppass);
		 dto.setAKA(aka);
		 PlayerDAO dao = new PlayerDAO();
		 dto = dao.getPlayerlog(dto);
		 
		 if(dto != null){ 
				//세션 영역에 아이디 이름 저장
			 	HttpSession session = req.getSession();
			 	
		        session.setAttribute("Id", dto.getId());
		        session.setAttribute("AKA", dto.getAKA());
		        
	//			req.setAttribute("Id", dto.getId());
	//			req.setAttribute("name", dto.getName());
	//			req.setAttribute("AKA", dto.getAKA());
				
		        PrintWriter out =resp.getWriter();
//		        out.println("<script>");
//				out.println("alert(어서오세요)");
//				out.println("</script>");
				System.out.println("로그인 성공");
				JSFunction.alertLocation(resp, "어서오세요", "./index.jsp");
				
		}
		 else {			
			 System.out.println("로그인실패..");
		 	JSFunction.alertLocation(resp, "일치하지 않습니다. 다시 확인해주세요", "./index.jsp");			 	
		 }
	}
}
