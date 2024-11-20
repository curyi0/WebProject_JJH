package utils;

/*
 totalCount; 전체 게시물의 갯수
 pageSize; web.xml에 설정한 값. 한페이지에 출력할 게시물 수
 blockPage; 위와 동일 한 블럭당 출력할 페이지 번호 수
 pageNum; 현재 진입해 있는 페이지 번호
  reqUrl;  게시판 목록에 요청명, 현재 페이지 url
  */
public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		String pagingStr="";
		/* 전체 페잊수 계산 
		ceil(전체게시물 수/ 한페이지당 게시물 수) => 결과를 올림처리 
		첫 줄 계산시 나눗셈이 정수결과로 나오기때문에 올림처리를 위해 double명시*/
		int totalPages= (int)(Math.ceil((double) totalCount/pageSize));

		/* 페이지블럭에서 첫 페이지번호를 구하기 위한 계산식 
		blockpage가 5로 설정했고 아래 계산식에 pagenum=1~5를 대입해보면 1의 결과가 나온다.
		즉, 1~5페이지일때는 pageTemp가 1이되어 반복 출력할 수 있다.
		 */
		int pageTemp= (((pageNum-1)/blockPage)* blockPage)+1 ;
		if(pageTemp!= 1) { //첫번째 블럭이 아닌 경우에만 이전페이지로가기 링크 출력
			pagingStr+="<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr+= "&nbsp;";
			pagingStr += "<a href='"+ reqUrl+"?pageNum="+ (pageTemp-1)
					+ "'>[이전블록]<a/>";
		}// 각 페이지 번호 출력
		int blockCount=1;
		while(blockCount<= blockPage && pageTemp<= totalPages) {
			if(pageTemp==pageNum) {//현재 페이지에 대한 링크 x
				pagingStr += "&nbsp;"+ pageTemp + "&nbsp;";
			}
			else {//현재페이지가 아닌 페이지에 링크 걸기
				pagingStr += "<a href='"+ reqUrl+"?pageNum="+ pageTemp 
						+ "'>"+ pageTemp+ "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		//다음페이지  블럭 바로가기 ' 출력
		if(pageTemp<= totalPages) {
			pagingStr+="<a href='"+ reqUrl+"?pageNum="+ pageTemp 
					+ "'>[다음 블록]</a>";
			pagingStr+= "&nbsp";
			pagingStr+="<a href='"+ reqUrl+"?pageNum="+ totalPages 
					+ "'>[마지막페이지]</a>";
		}
		return pagingStr;
	}
}
