package players;

import common.DBConnPool;

public class PlayerDAO extends DBConnPool{
	
	
	public PlayerDTO getPlayerlog(PlayerDTO dto) {//로그인처리 쿼리 실행 함수
				
		try {
			String query="SELECT * FROM Players WHERE id=? and pass=?";
						
			psmt= con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());			
			
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 있으면 DTO객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외 발생");
		}
		
		return dto;
	}
	// 회원가입시 정보 저장 및 관리
		public String getPlayerSign(PlayerDTO dto) {
				
			try {
			String Query= "INSERT INTO Players (name, id, pass, phonenum, AKA, JUMIN, addr, status) " 
         	       		+ " VALUES ( seq_player.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			rs = psmt.executeQuery(Query);
			
			if(rs.next()) { // 있으면 DTO객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setPhonenumber(rs.getNString("phonenum"));
				dto.setAKA(rs.getString("AKA"));
				dto.setJumin(rs.getString("JUMIN"));
				dto.setAddress(rs.getString("addr"));
				dto.setStatus(rs.getString("status"));
						
				
			}}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return "";
		}
	
}