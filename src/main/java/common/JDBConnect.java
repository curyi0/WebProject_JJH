package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() { // 매개변수 없는 생성자
		try {
			// 오라클 드라이버 메모리에 로드
			Class.forName("oracle.jdbc.OracleDriver");
			// 커넥션url 생성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "education";// 계정 id pwd
			String pwd = "1234";
			// db 연결 시도
			// connection 인스턴스가 반환 되면 연결 성공!
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공(기본 생성자)");

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
// 생성자 메서드 오버로딩 , 클래스 안에 정보를 써주는게 아니라
	public JDBConnect(String driver	,String url, String id, String pwd) { //매개변수 없는 생성자
		try {
			//오라클 드라이버 메모리에 로드
			Class.forName(driver);
			con=DriverManager.getConnection(url, id, pwd);
		
			System.out.println("DB 연결 성공(인수 생성자)");
		}
		
		
	 catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}}


	//인자생성자2  application 내장객체의 원본 타입을 매개변수로 선언
	public JDBConnect( ServletContext application) {
		try {
			/*
		내장객체를 매개변수를  통해 전달받았으므로 자바클래스 내에서 web.xml 접근 가능
		jsp에서 db연결을 위해 반복적으로 사용했던 코드를 줄일수 있음
			 * */
			String driver= application.getInitParameter("OracleDriver");
			//얻어온 값들을 통해 드라이버 로드와 db연결을 진행
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd=application.getInitParameter("OraclePwd");
			con= DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수생성자2");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
