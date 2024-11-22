package fileupload;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 어노테이션을 통해 매핑한다. 
 
@WebServlet("/13FileUpload/MultipleProcess.do")

@MultipartConfig(
	maxFileSize = 1024 *1024*1, //파일1개당 최대용량을 1Mb로 지정
	maxRequestSize =1024 *1024*10 //첨부할 전체 파일의 용량을 10Mb로 지정
	
		)

public class MultipleUploadProcess extends HttpServlet{
	private static final long serialVersionUID=1L;
	
	//파일업로드는 post방식이라 dopost() 오버라이딩
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		try {//파일이 저장될 디렉토리의 물리적경로를 얻어온다.
			String saveDirectory =getServletContext().getRealPath("/Uploads");
			//멀티 파일 업로드를 위한 함수 호출
			ArrayList<String> listFileName= FileUtil.multipleFile(req, saveDirectory);
			
			//업로드한 파일의 개수만큼 반복하여 파일명 변경 (파일이 여러개라 반복문)
			for(String originalFileName: listFileName){
			String savedFileName=FileUtil.renameFile(saveDirectory, originalFileName);
			}
			
		resp.sendRedirect("FileList.jsp");//업로드가 완료되면 파일 목록페이지로
		}
		catch (Exception e) {
			//업로드 실패 시 request영역에 에러메시지를 저장후 포워드
			e.printStackTrace()	;
			req.setAttribute("errorMessage", "파일 업로드오류");
			req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
		}
	}	
	
}
