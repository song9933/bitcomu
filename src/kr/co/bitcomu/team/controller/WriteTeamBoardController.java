package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;

@WebServlet("/team_board_write.do")
public class WriteTeamBoardController extends HttpServlet {
	private TeamDAO dao;
	public WriteTeamBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		dao.insertTeamBoard(
				new Team() .setUserId(req.getParameter("userId"))
						   .setTeamBoardTitle(req.getParameter("teamBoardTitle"))
						   .setTeamBoardContent(req.getParameter("teamBoardContent"))
		);
		res.sendRedirect("team_board_list.do");
	}
	
}
