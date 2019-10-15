package kr.co.bitcomu.team.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;
import kr.co.bitcomu.repository.vo.User;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/team/teamBoardWrite.do")
public class WriteTeamBoardController extends HttpServlet {
	
	private TeamDAO dao;

	public WriteTeamBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/json; charset=utf-8");		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(req.getParameter("teamNo"));
		System.out.println(req.getParameter("projectNo"));
		dao.insertTeamBoard(
				new Team().setUserNo(user.getUserNo())
						.setTeamNo(Integer.parseInt(req.getParameter("teamNo")))
						.setProjectNo(Integer.parseInt(req.getParameter("projectNo")))
						.setTeamBoardTitle(req.getParameter("teamBoardTitle"))
						.setTeamBoardContent(req.getParameter("teamBoardContent")));
		
		res.sendRedirect("teamBoardList.do");
	}
}
// 파일
// 업로드--------------------------------------------------------------------------------
//		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
//		String path = "/board" + sdf.format(new Date());
//		File file = new File("c:/java/upload" + path);
//		if (file.exists() == false) file.mkdirs(); 
//		
//		// 메모리와 임시저장에 대한 옵션을 설정
//		DiskFileItemFactory disk = new DiskFileItemFactory();
//		disk.setRepository(new File("c:/java/temp"));
//		disk.setSizeThreshold(1024);
//		
//		// request 의 정보를 파싱 처리하는 클래스(cos.jar에서 MultipartRequest의 역활)
//		ServletFileUpload upload = new ServletFileUpload(disk);
//		try {
//			List<FileItem> lists = upload.parseRequest(req);
//			for (FileItem item : lists) {
//				// input 태그의 name 속성의 값을 반환
////				System.out.println(item.getFieldName());
//				// type이 file 인지 아니면 일반 폼 타입인지 확인
//				if (item.isFormField()) {  // 타입이 파일이 아닌 경우 true
//					// input 속성에 입력한 값을 반환
//					System.out.println(item.getString());
//				} else {  // 타입이 파일인 경우
//					// 원본파일명, 파일의 크기
//					String name = item.getName();
//					long size = item.getSize();
//					String contentType = item.getContentType();
////					System.out.println("파일명 : " + name);
////					System.out.println("파일크기 : " + size);
////					System.out.println("파일타입 : " + contentType);
//					
//					// 실제 저장하는 파일의 이름(직접 - UUID 활용)
//					String ext = "";
//					int index = name.lastIndexOf(".");
//					if (index != -1) ext = name.substring(index);
//					File f = new File(file, UUID.randomUUID().toString() + ext);
//					item.write(f);
//					if (contentType.startsWith("image/")) {
//						// 썸네일 이미지 생성하기
//						Thumbnails.of(f)
//								 .size(300, 200)
//								 .outputFormat("jpg")
//								 .toFile(new File(f.getParent(), "thumb_" + f.getName()));
//					}
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		
//	}
//	
//}
