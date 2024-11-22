package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.rmi.ServerException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUtil {

	//파일 업로드
	public static String uploadFile(HttpServletRequest req, String sDirectory) 
			throws  IOException, ServletException {
		//파일저장을 위한 디렉토리와 request내장객체를 매개변수로 정의 
		
	/*파일첨부를 위한 <input>태그의 name속성값을 이용해서 Part인스턴스를 생성
	 이를 통해 파일을 서버에 저장할 수 있다.	 */
		Part part = req.getPart("ofile");

		/*Part인스턴스에서 헤더값을 통해 원본파일명을 얻어온다. 차후 업로드 테스트 시 콘솔에서 확인 가능*/
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader=" + partHeader);

		/* 헤더값을 통해 얻어온 문자열에서 "filename="을 구분자로 split한다. String타입 배열로 반환
		 */
		String[] phArr = partHeader.split("filename=");
		//위 결과의 1인덱스가 파일명이 됨, 공백 제거후 " "을 ""로 변경,  자바 문자열구분특성 ""앞에\붙여줌  
		String originalFilename = phArr[1].trim().replace("\"", "");

		/* 전송되 파일이 있는 경우, 서버의 디렉토리에 파일을 저장
		 File.separator: 운영체제마다 경로를 표시하는 기호가 달라 해당os에 맞는 구분기호 자동추가
		 */
		if (!originalFilename.isEmpty()) {
			part.write(sDirectory + File.separator + originalFilename);
		}
		return originalFilename;//저장된 원본파일명 반환

	}

	//파일명 변경
	/* 서버에 저장된 파일명이 한글인 경우 웹브라우저에서 깨짐현상이 발생할수 있어 영문이나 숫자
	 조합으로 변경하는 게 안전 */
	public static String renameFile(String sDirectory, String fileName) {
		//파일명에서 확장자 자르기위해 뒤에서찾음 (.을 2개이상사용할수 있기때문ㅇ)
		String ext = fileName.substring(fileName.lastIndexOf("."));
		//파일명으로 사용할 문자열, 날짜▪시간을 이용해 "년월일_시분초"형태/ S( ms) 
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());

		String newFileName = now + ext; //파일명 생성

  // 원본파일명과 새파일명을 이용해 File인스턴스 생성
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);//새파일명으로 변경

		return newFileName;//파일명 반환
	}
	//multiple속성이 부여되어 2개이상의 파일을 업로드처리
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
	throws IOException, ServletException{
		ArrayList<String> listFileName= new ArrayList<>();//파일 저장을위한 List계 컬렉션생성
		
		Collection<Part> parts= req.getParts();//getParts메서드로 Part인스턴스를 컬렉션의 형태로생성
		for (Part part: parts) {
		//전송된 폼값 중 파일이 아니라면 업로드이 대상이 아니므로 반복문의 처음으로 이동
			if(!part.getName().equals("ofile")) continue;
			
			String partHeader= part.getHeader("content-disposition");
			System.out.println("partHeadr="+partHeader);
			
			String[] phArr = partHeader.split("filename=");
			String originalFilename = phArr[1].trim().replace("\"", "");
			
			if (!originalFilename.isEmpty()) {
				part.write(sDirectory + File.separator + originalFilename);
			}
			listFileName.add(originalFilename);
		}
		return listFileName;
	}
	public static void download(HttpServletRequest req, HttpServletResponse resp,
            String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                           "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );

            //out.clear();  // 출력 스트림 초기화

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }

	//파일 삭제
	public static void deleteFile(HttpServletRequest req, String directory, String filename	) {
		String sDirectory= req.getServletContext().getRealPath(directory);//디렉토리 물리적경로 얻기
		File file= new File(sDirectory + File.separator+ filename);//경로와 파일명 이용해 file객체생성
		//해당경로에 파일이 존재하면 즉시 파일삭제
		if(file.exists()) {
			file.delete();
		}
	}
}
