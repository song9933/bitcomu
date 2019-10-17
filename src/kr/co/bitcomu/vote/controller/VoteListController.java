package kr.co.bitcomu.vote.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/vote/votelist.do")
public class VoteListController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		List<Vote> list = dao.selectVote();
		for(Vote v : list) {
			v.setUserId(dao.selectUserId(v.getVoteNo()));
		}
		req.setAttribute("list", list);
		req.getRequestDispatcher("/jsp/vote/votelist.jsp").forward(req, res);
	}

}
