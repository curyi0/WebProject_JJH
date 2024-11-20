package utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

public class JSFunction {//자주 사용하는 자바스크립트의 함수를 클래스 정의
	//static메서드 생성을 통해서 정의 하면 해당클래스의 인스턴스 생성 없이 바로 메서드 호출가능
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		//jsp의 내장객체out을 사용하기 위해 JspWriter를 사용
		try {
			String script= ""+"<script>"
					+"  alert('"+ msg +"');"
					+ " location.href='" +url+"';"
					+"</script>";
			out.println(script);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script= ""+"<script>"
					+"  alert('"+ msg +"');"
					+ " history.back();"
					+"</script>";
			out.println(script);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//서블릿에서 자바스크립트를 실행하도록 정의한 메서드, jsp로 포워드하지 않고 즉시 출력해야하므로 컨텐츠타입을 먼저 설정하고 있다.
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer= resp.getWriter();
			//경고창을 띄우고 특정 페이지로 이동할 수 있는 js코드 작성
			String script="" +"<script>"+ " 	alert('" + msg + "');"
					+ "     location.href='" + url + "';" + "</script>";
			writer.print(script);
		}
		catch (Exception e) {
			// TODO: handle exception
		}}
	
	//경고창 띄우고 뒤로이동하는 js코드
		public static void alertBack(HttpServletResponse resp, String msg) {
			try {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter writer= resp.getWriter();
				String script="" +"<script>"+ " 	alert('" + msg + "');"
						+ "  history.back();" + "</script>";
				writer.print(script);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	
}
