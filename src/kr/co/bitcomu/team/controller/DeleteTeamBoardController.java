package kr.co.bitcomu.team.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;

@WebServlet("/team/teamBoardDelete.do")
public class DeleteTeamBoardController extends HttpServlet {
	
	private TeamDAO dao;
	
	public DeleteTeamBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 데이터베이스 처리하기
		dao.deleteTeamBoard(Integer.parseInt(req.getParameter("teamBoardNo"))); 
		dao.deleteboardcomment(Integer.parseInt(req.getParameter("teamBoardNo"))); 
		int teamNo = Integer.parseInt(req.getParameter("teamNo"));
		int projectNo = Integer.parseInt(req.getParameter("projectNo"));
		res.sendRedirect("teamBoardList.do?projectNo=" + projectNo + "&teamNo=" + teamNo);
	}
}











