package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;

@WebServlet("/team/teamCommentDelete.do")
public class DeleteTeamCommentController extends HttpServlet {
	private TeamDAO dao;

	public DeleteTeamCommentController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteTeamComment(Integer.parseInt(req.getParameter("cmtNo")));
		res.sendRedirect(req.getContextPath() + "/team/teamBoardDetail.do?teamBoardNo=" + req.getParameter("teamBoardNo"));
		
	}
	
	
	
	
	
}
