package mvcboard;

import java.io.IOException;
import java.util.ArrayList;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; 

import utils.JSFunction;

@WebServlet("/MedWin/write.do")
public class WriteControl extends HttpServlet {
	 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 작성 버튼을 눌렀을 때 로그인 확인
		HttpSession session = req.getSession();

		// session영역에 회원확인, 로그인 중이면 작성페이지로, 속성이 없다면 로그인 페이지로 이동한다.
		if (session.getAttribute("Id") != null) {
			req.getRequestDispatcher("write.jsp").forward(req, resp);
		} else {			
			JSFunction.alertLocation(resp, "로그인 후 사용해 주세요", "./Login.jsp");
			return;// 더이상 코드가 실행하지 않도록 차단
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = new MVCBoardDTO();
		ArrayList<MVCBoardDTO> qLists = dao.insertList();

		if (qLists != null) {
			for(MVCBoardDTO qList : qLists) {
				
				req.setAttribute("qLists", qLists);
				System.out.println(qLists);
			}
			req.getRequestDispatcher("QABoard.jsp").forward(req, resp);;
		}
		
	}
}
