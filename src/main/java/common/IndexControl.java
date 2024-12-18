package common;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import players.PlayerDAO;
import players.PlayerDTO;

@WebServlet("/MedWin/index.do")
public class IndexControl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인폼
	req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
