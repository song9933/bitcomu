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

@WebServlet("/team/teamBoardWriteform.do")
public class WriterFormTeamBoardController extends HttpServlet {
	private TeamDAO dao;
	public WriterFormTeamBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("projectNo", req.getParameter("projectNo"));
		req.setAttribute("teamNo", req.getParameter("teamNo"));
//		req.setAttribute("list", dao.selectTeamBoard());
		req.setAttribute("codeValue", dao.selectTeamCode());
		req.getRequestDispatcher("/jsp/teamboard/team_board_write.jsp").forward(req, res);
		
	}
}









