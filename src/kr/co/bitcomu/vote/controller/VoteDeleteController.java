package kr.co.bitcomu.vote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;

@WebServlet("/vote/votedelete.do")
public class VoteDeleteController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int voteNo = Integer.parseInt(req.getParameter("voteDelete"));
		dao.deleteVote(voteNo);
		res.sendRedirect("votelist.do");
		
	}

	
}
