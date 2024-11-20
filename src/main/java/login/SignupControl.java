package login;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import players.PlayerDAO;
import players.PlayerDTO;
import utils.JSFunction;
@WebServlet("/signup.do")
public class SignupControl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./signup.do");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	PlayerDTO dto = new PlayerDTO();
	PlayerDAO dao  =new PlayerDAO();
	String intr=dao.getPlayerSign(dto);
	
	String pId=req.getParameter("Id");
	String pPass=req.getParameter("pass");
	String Name=req.getParameter("name");
	String Jumin=req.getParameter("jumin");
	String Addr=req.getParameter("addr");
	String Phonenum=req.getParameter("phonenum");
	
	try {
		//필수 입력사항을 모두 입력했는지 확인 후 가입승인
		if(intr != dto.getId() || intr != dto.getPass() || intr != dto.getName() ||
				intr != dto.getAddress() || intr != dto.getJumin() || intr!=dto.getPhonenumber() ){
			
			JSFunction.alertBack(resp, "가입성공!, 환영합니다.");
			req.getRequestDispatcher("./index.do");
		}	
		
		else if(intr == dto.getId() && intr == dto.getPass() && intr == dto.getName() 
				&& intr == dto.getJumin() && intr==dto.getPhonenumber() ) {
			JSFunction.alertLocation(resp, "이미 가입한 회원입니다. 로그인을 해주세요", "/Login.do");
			//System.out.println("<script>alert(이미 가입한 회원입니다. 로그인을 해주세요)</script");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		JSFunction.alertBack(resp, "가입실패,입력란을 모두 채웠는지 확인해주세요");
		req.getRequestDispatcher("./Login.do");
		}
	return ;
	}
}
