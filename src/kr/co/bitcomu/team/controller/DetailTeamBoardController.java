package kr.co.bitcomu.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;


@WebServlet("/team/teamBoardDetail.do")
public class DetailTeamBoardController extends HttpServlet {
private TeamDAO dao;
	
	public DetailTeamBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("teamBoardNo"));
		Team t =  dao.selectOneTeamBoard(no);
		req.setAttribute("teamBoard", t);
		req.setAttribute("codeValue", dao.selectTeamCode());
		// 댓글
		req.setAttribute("teamCmt", new Gson().toJson(dao.selectTeamComment(no)));
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/teamboard/team_board_detail.jsp");
		rd.forward(req, res);
	}
}
