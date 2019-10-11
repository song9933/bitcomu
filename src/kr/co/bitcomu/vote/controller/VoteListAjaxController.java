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

@WebServlet("/vote/votelistajax.do")
public class VoteListAjaxController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteListAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("만약 이게 안나온다면 아작스는 시스아웃이 안되는거야.");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		int rnum = (Integer.parseInt(req.getParameter("pageno")))*7;
//		System.out.println("rnum" + rnum);
		List<Vote> list;
		if(rnum < 7) {
			list = dao.selectVoteNSmall(rnum);
		} else {
			list = dao.selectVoteN(rnum);
		}
		for(Vote v : list) {
			v.setUserId(dao.selectUserId(v.getVoteNo()));
		}
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(list));
//		System.out.println(new Gson().toJson(list));
		out.close();
	}
	
}
