package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/team/teamBoardWriteform.do")
public class WriterFormTeamBoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("projectNo", req.getParameter("projectNo"));
		req.getRequestDispatcher("/jsp/teamboard/team_board_write.jsp").forward(req, res);
	}
}









