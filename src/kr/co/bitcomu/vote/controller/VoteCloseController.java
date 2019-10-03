package kr.co.bitcomu.vote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/vote/closevote.do")
public class VoteCloseController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteCloseController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		super.doGet(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		super.doPost(req, res);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		/*update tb_vote 
		   set VOTE_TITLE = #{voteTitle}, 
		       VOTE_CONTENT = #{voteContent}
		       VOTE_TYPE = #{voteType}
		       VOTE_MENU = #{voteMenu}
		       vote_notice_enabled = #{voteNoticeEnabled}
		       vote_anony_enabled = #{voteAnonyEnabled}
		       vote_close_enabled = #{voteCloseEnabled}
		       vote_close_dt = #{voteCloseDt}
		 where VOTE_NO = #{voteNo}*/
		
		int voteNo = Integer.parseInt(req.getParameter("voteClose"));
		dao.updateVoteCloseEnabled(voteNo);
		res.sendRedirect("votelist.do");
		
	}
	
}
