package kr.co.mlec.notice.controller;

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



@WebServlet("/notice/write.do")
public class WriteNoticeController extends HttpServlet {
	private NoticeDAO dao;
	public WriteNoticeController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(NoticeDAO.class);
	}
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Notice n = new Notice();
		n.setTitle(req.getParameter("title"));
		n.setContent(req.getParameter("content"));
		n.setUserNo(user.getUserNo());
		dao.insertNotice(n);
		res.sendRedirect("noticeList.do");
	}
}














