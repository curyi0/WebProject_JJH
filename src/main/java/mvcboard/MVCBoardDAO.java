package mvcboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool{	
	//작성글 넣을 클래스
	public ArrayList<MVCBoardDTO> insertList() {
		
		ArrayList<MVCBoardDTO> Lists= new ArrayList<MVCBoardDTO>();
		
		String query="insert into QABoard(idx, qid, qTitle, quest, rid, reply) "
				+ "  values(serial_num.nextval, ,?,?,?,?,?) ";
		
		try {			
			psmt=con.prepareStatement(query);
			
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setQid(rs.getString("qid"));
				dto.setQtitle(rs.getString("qTitle"));
				dto.setQuest(rs.getString("quest"));
				dto.setRid(rs.getString("rid"));
				dto.setReply(rs.getString("reply"));
				
				psmt.setString(1, dto.getQid());
				psmt.setString(2, dto.getQtitle());
				psmt.setString(3, dto.getQuest());
				psmt.setString(4, dto.getRid());
				psmt.setString(5, dto.getReply());
//				
				psmt.executeUpdate();
				
				Lists.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			} 
		return Lists;	
	}
	//ArrayList<MVCBoardDTO>
	//게시물 조회수 카운트 클래스 
	public void visitCount() {
		String selectquery="SELECT COUNT(*) FROM QABoard";
		
		ArrayList<MVCBoardDTO> list= new ArrayList();
		int watchcnt=0;
		String visitquery= "SELECT QTITLE, VISITCOUNT FROM QABoard"
				 	  +" WHERE	IDX=? ";
			
		//String addvisitquery = "UPDATE QABOARD SET VISITCOUNT=VISICOUNT+1";
		//rs= psmt.executeUpdate(addvisitquery);
			
		}
	//게시물 목록 조회하기
	public void watchList() {
		
		String query="select * from ("
				+ "  select QA.*, rownum rNum from\r\n"
				+ "  (select * from QABoard order by idx desc) QA"
				+ ")"
				+ "  where rNum between 1 and 10";
		try {			
			psmt=con.prepareStatement(query);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		}
	}
//}
