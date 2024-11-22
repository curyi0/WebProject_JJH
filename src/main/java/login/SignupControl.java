package login;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import players.PlayerDAO;
import players.PlayerDTO;
import utils.JSFunction;

@WebServlet("/MedWin/signup.do")
public class SignupControl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PlayerDTO dto = new PlayerDTO();
		PlayerDAO dao = new PlayerDAO();
		int rslt= dao.getPlayerSign(dto);
		System.out.println(rslt); // 1, -1
	while(rslt >0) {
		// 각 필수 항목들이 입력 되지 않은 게 있으면 경고창 발생
		String[] inserts = { "Id", "pass", "name", "jumin", "addr", "phonenum" };
		String[] Values = new String[inserts.length];
		String[] failMessages = { "아이디를 입력해 주세요.", "비밀번호를 입력해 주세요.", "이름을 입력해 주세요.", "주민번호를 입력해 주세요.", "주소를 입력해 주세요.",
				"전화번호를 입력해 주세요." };

		boolean allFilled = true;

		for (int i = 0; i < inserts.length; i++) {
				Values[i] = req.getParameter(inserts[i]);
			if (Values[i] == null || Values[i].isEmpty()) {
				JSFunction.alertBack(resp, failMessages[i]);
				allFilled = false;
				break;
			}
		}

		if (allFilled) {
			// 모든 필수 입력사항이 입력되었을 때의 처리
			JSFunction.alertLocation(resp, "가입성공!", "./Login.jsp");
			System.out.println("회원가입완료");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
		// if(intr != pId || intr != pPass || intr != Name ||
		// intr != Jumin || intr != Addr || intr!=Phonenum ){
		//
		// JSFunction.alertBack(resp, "가입성공!, 환영합니다.");
		// req.getRequestDispatcher("./index.jsp");
		// }
		//
		// else if(intr != pId && intr != pPass && intr != Name &&
		// intr != Jumin && intr != Addr && intr!=Phonenum ) {
		// JSFunction.alertLocation(resp, "이미 가입한 회원입니다. 로그인을 해주세요",
		// "/MedWin/Login.do");
			
	}
}