package kr.co.bitcomu.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;
import kr.co.bitcomu.repository.vo.Notice;
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/notice/noticeUpdate.do")
public class UpdateNoticeController extends HttpServlet {
	
	private NoticeDAO dao;
	
	public UpdateNoticeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(NoticeDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		
		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		Notice notice = new Notice();
		notice.setPostNo(Integer.parseInt(request.getParameter("postNo")));
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content").replace("\r\n", "<br>"));
		notice.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		dao.updateNotice(notice);
		
		
		

		res.sendRedirect("/bitcomu/notice/noticeList.do");
	}
}










