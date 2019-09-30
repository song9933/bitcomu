package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;

@WebServlet("/team/teamBoardList.do")
public class ListTeamBoardController extends HttpServlet {
	private TeamDAO dao;
	
	public ListTeamBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int projectNo = 1;
		if (req.getParameter("projectNo") != null) {
			projectNo = Integer.parseInt(req.getParameter("projectNo"));
		}
		int teamNo = 1;
		if (req.getParameter("teamNo") != null) {
			teamNo = Integer.parseInt(req.getParameter("teamNo"));
		}
		req.setAttribute("projectNo", projectNo);
		req.setAttribute("teamNo", teamNo);
		req.setAttribute("list", dao.selectTeamBoard());
		req.getRequestDispatcher("/jsp/teamboard/team_board_list.jsp").forward(req, res);
	}
	
}
