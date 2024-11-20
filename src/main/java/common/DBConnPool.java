package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*  
 * */
public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	//디비와 연결된 커넥션 인스턴스를 미리 만들어 풀에 저장해 두었다가 필요할때 가져다 쓰고 반납하는 기술.
	//DB의 부하를 줄이고 자원을 효율적으로 관리할 수 있다.
	public DBConnPool() {
		try {
			//context 인스턴스 생성  (tomcat 웹서버라 생각하면 된다.)
			Context initCtx= new InitialContext();
	//앞서 생성한 인스턴스를 통해 JNDI서비스 구조의 초기 Root디렉토리를 얻어온다.
	//디렉토리 이름은 저장되어 있는 이름 그대로 사용 했다.
			Context ctx= (Context)initCtx.lookup("java:comp/env");
	  //server.xml 에 등록한 네이밍을 lookup하여 Datasource를 얻어온다. 즉,DB연결을 위한 정보를 가지고 있다.
			DataSource source= (DataSource)ctx.lookup("dbcp_webproject");
			//커넥션풀에 생성해 둔 객체를 가져다가 사용, 실제 db연결 처리
			con= source.getConnection();
			System.out.println("dbcp_webproject 커넥션 풀연결 성공!");
		} 
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("dbcp_webproject 커넥션 풀 연결 실패..");
			e.printStackTrace()	;
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
		System.out.println("DB 커넥션 풀 자원 반납");
		
	}
	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
	}