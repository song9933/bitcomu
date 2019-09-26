package kr.co.bitcomu.vote.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/vote/votedetail.do")
public class VoteDetailController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int voteNo = Integer.parseInt(req.getParameter("voteNo"));
		Vote vote = dao.selectOneVote(voteNo);
		
		//투표 메뉴 관련 데이터 가공 처리 시작
		String[] splitedMenu = vote.getVoteMenu().split("★");
		List<String> realMenu = new ArrayList<String>();
		for(String m : splitedMenu) {
//			System.out.println(m);
			if(m.equals("")) continue;
			realMenu.add(m);
			System.out.print(m + ", ");
		}
		req.setAttribute("realMenu", realMenu);
		req.setAttribute("vote", vote);
		req.getRequestDispatcher("/jsp/vote/votedetail.jsp").forward(req, res);
	}
	
}
