package kr.co.bitcomu.talk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Notice;
import kr.co.bitcomu.repository.vo.Talk;
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/talk/write.do")
public class WriteTalkController extends HttpServlet {
	private TalkDAO dao;
	public WriteTalkController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		req.setAttribute("user", user);
	
		
		Talk  
			
			n = new Talk();
		
		
		n.setTitle(req.getParameter("title"));
		n.setContent(req.getParameter("content"));
		n.setUserNo(user.getUserNo());
		dao.insertTalk(n);
		res.sendRedirect("talkList.do");
	}
}














