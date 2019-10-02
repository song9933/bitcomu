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
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/updateTalkForm.do")
public class UpdateFormTalkController extends HttpServlet {

	private TalkDAO dao;
	
	public UpdateFormTalkController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		/*
		int no = Integer.parseInt(req.getParameter("no"));
		Board board = dao.selectOneBoard(no);
		req.setAttribute("board", board);
		RequestDispatcher rd = req.getRequestDispatcher("updateform.jsp");
		rd.forward(req, res);
		*/
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		req.setAttribute("user", user);
		
		req.setAttribute(
			"board", dao.selectOneTalk(Integer.parseInt(req.getParameter("postNo")))
		);
		req.getRequestDispatcher("/jsp/talk/talk_update.jsp").forward(req, res);
	}
}











