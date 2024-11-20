package mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

public class QABoardControl extends HttpServlet{

	//글쓰기 페이지에 진입하는것은 버튼을 클릭하여 이동하게 되므로 get방식 요청
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//로그인 확인
		HttpSession session= req.getSession();
		
		//session영역에 회원인증에 관련된 속성이 없다면 로그인 페이지로 이동한다.
		if(session.getAttribute("Id")==null) {
			JSFunction.alertLocation(resp, "로그인 후 사용해주세요", "./Login.jsp");
			return;// 더이상 코드가 실행하지 않도록 차단
		}
		
		//로그인이 완료된 상태라면 Q&A페이지를 포워드함
		req.getRequestDispatcher("/QABoard.jsp").forward(req, resp);
}
}
