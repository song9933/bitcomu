package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;

@WebServlet("/team/teamBoardUpdateform.do")
public class UpdateFormTeamBoardController extends HttpServlet {

	private TeamDAO dao;
	
	public UpdateFormTeamBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setAttribute(
			"teamBoard", dao.selectOneTeamBoard(Integer.parseInt(req.getParameter("teamBoardNo")))
		);
		req.getRequestDispatcher("/jsp/teamboard/team_board_update.jsp").forward(req, res);
	}
}











