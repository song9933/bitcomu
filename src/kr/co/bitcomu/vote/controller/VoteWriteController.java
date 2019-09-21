package kr.co.bitcomu.vote.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/jsp/vote/votewrite.do")
public class VoteWriteController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}



	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Vote vote = new Vote();
		//유저테이블 병합후 로그인세션에서 유저번호 얻어오는 방식으로 번경
		vote.setUserNo(1);
		vote.setVoteTitle(req.getParameter("voteTitle"));
		vote.setVoteContent(req.getParameter("voteContent"));
		if(req.getParameter("voteMultiCheck") != null) {
			//중복체크가 가능하면 타입이 0번 체크박스형태로 변경
			vote.setVoteType(0);
		} else {
			//중복체크가 가능하면 항목들이 1번 라디오박스형태가 됨
			vote.setVoteType(1);
		}
		
		//항목들로부터 넘겨받은 입력값들을 하나의 스트링으로 변환
		String[] menu = req.getParameterValues("menu");
		StringBuffer sb = new StringBuffer();
		for(String m : menu) {
			sb.append(m + "★");
		}
		String convertedMenu = sb.toString();
		
//		System.out.println("어레이스투스트링: " +result );
//		System.out.println(convertedMenu);
		
		vote.setVoteMenu(convertedMenu);
		System.out.println(req.getParameter("voteNotice"));
		if(req.getParameter("voteNotice") != null) {
			vote.setVoteNotice("Y");
		} else {
			vote.setVoteNotice("N");
		}
		if(req.getParameter("voteAnonymous") != null) {
			vote.setVoteAnonymous("Y");
		} else {
			vote.setVoteAnonymous("N");
		}
		
		//일단 마감일은 등록일로부터 2일후로 설정
		Calendar c = Calendar.getInstance();
		c.add(c.DAY_OF_MONTH, 2);
		Date twoDaysLater = c.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-YYYY HH:mm:ss");
		String after2day = sdf.format(twoDaysLater);
		//마감일자 설정부분은 자바스크립트 공부한후에 다시하기
		System.out.println(after2day);
		vote.setVoteExDate(after2day);
		dao.insertVote(vote);
		
		res.sendRedirect("votelist.do");
	}

}
