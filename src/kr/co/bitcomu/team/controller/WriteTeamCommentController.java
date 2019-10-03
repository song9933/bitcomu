package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/team/teamCommentWrite.do")
public class WriteTeamCommentController extends HttpServlet{
	private TeamDAO dao;

	public WriteTeamCommentController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Comment cmt = new Comment();

		cmt.setUserNo(user.getUserNo());
		cmt.setBoardPostNo(Integer.parseInt(req.getParameter("boardPostNo")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		
		dao.insertTeamComment(cmt);
		res.sendRedirect("/team/teamBoardDetail.do?teamBoardNo=" + Integer.parseInt(req.getParameter("teamBoardNo")));
	}
	
	
}
