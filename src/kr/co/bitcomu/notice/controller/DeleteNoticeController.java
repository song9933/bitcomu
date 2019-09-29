package kr.co.bitcomu.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;



@WebServlet("/noticedelete.do")
public class DeleteNoticeController extends HttpServlet {
	
	private NoticeDAO dao;
	
	public DeleteNoticeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(NoticeDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 데이터베이스 처리하기
		dao.deleteNotice(Integer.parseInt(req.getParameter("postNo"))); 
		res.sendRedirect("/bitcomu/notice/noticeList.do");
	}
}











