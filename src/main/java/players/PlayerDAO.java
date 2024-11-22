package players;

import common.DBConnPool;
import utils.JSFunction;

public class PlayerDAO extends DBConnPool{
	
	
	public PlayerDTO getPlayerlog(PlayerDTO dto) {//로그인처리 쿼리 실행 함수
				
		String query="SELECT * FROM Players WHERE id=? and pass=?";
		try {
						
			psmt= con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());	
			
			System.out.println("dto="+dto.getId());
			System.out.println("dto="+dto.getPass());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 있으면 DTO객체에 저장   넘어온  dto값으로 로그인 정보 확인
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setAKA(rs.getString("AKA"));		
				
				System.out.println("db값="+rs.getString("id"));
			}
			else {
				dto = null;
			}			
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외 발생");
		}
		
		return dto;
	}
	//회원가입 정보 조회  있으면 회원임을 알리고 로그인 진행
	
		public PlayerDTO getPlayerCheck(PlayerDTO dto) {
			
			String query="SELECT * FROM Players WHERE id=? or pass=? or name=?";
			
			try {
				if(rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setName(rs.getString("name"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
	// 회원가입시 정보 저장 및 관리
		public int getPlayerSign(PlayerDTO dto) {
			
			int result=0;	
			try {
			String Query= "INSERT INTO Players (name, id, pass, phonenum, AKA, JUMIN, addr, status) " 
         	       		+ " VALUES ( seq_player.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?) ";
			psmt=con.prepareStatement(Query);
			
			if(rs.next()) { // 있으면 DTO객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setPhonenumber(rs.getString("phonenum"));
				dto.setAKA(rs.getString("AKA"));
				dto.setJumin(rs.getString("JUMIN"));
				dto.setAddress(rs.getString("addr"));
				dto.setStatus(rs.getString("status"));
						
					
				psmt.executeUpdate();
				
				}			
			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
	
}