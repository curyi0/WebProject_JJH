package mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/MedWin/QABoard.do")
public class QABoardControl extends HttpServlet{

	//글쓰기 페이지에 진입하는것은 버튼을 클릭하여 이동하게 되므로 get방식 요청
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		
	//로그인이 완료된 상태라면 Q&A페이지를 포워드함
	req.getRequestDispatcher("QABoard.jsp").forward(req, resp);
		
}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getAttribute("");
	}
}
