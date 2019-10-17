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
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/vote/votewrite.do")
public class VoteWriteController extends HttpServlet{
	private VoteDAO dao;
	
	public VoteWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}



	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Vote vote = new Vote();
		//유저테이블 병합후 로그인세션에서 유저번호 얻어오는 방식으로 번경
		
		//로그인한 유저정보를 얻어와 글쓴이로 설정.
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		vote.setUserNo(user.getUserNo());
		vote.setVoteTitle(req.getParameter("voteTitle"));
		vote.setVoteContent(req.getParameter("voteContent"));
		if(req.getParameter("voteMultiCheck") != null) {
			//중복체크허용을 선택했다면 0번 체크박스형태로 변경
			vote.setVoteType(0);
		} else {
			//중복체크허용을 선택하지 않아서 null이 넘어 왔다면 1번 라디오박스형태가 됨
			vote.setVoteType(1);
		}
		
		//항목들로부터 넘겨받은 입력값들을 하나의 스트링으로 변환
		String[] menu = req.getParameterValues("menu");
		StringBuffer sb = new StringBuffer();
		for(String m : menu) {
			sb.append(m + "★");
		}
		String convertedMenu = sb.toString();
		
		
		vote.setVoteMenu(convertedMenu);
		if(req.getParameter("voteNotice") != null) {
			vote.setVoteNoticeEnabled("Y");
		} else {
			vote.setVoteNoticeEnabled("N");
		}
		if(req.getParameter("voteAnonymous") != null) {
			vote.setVoteAnonyEnabled("Y");
		} else {
			vote.setVoteAnonyEnabled("N");
		}
		
		//일단 마감일은 등록일로부터 2일후로 설정
		
		/*
		2019-10-03T20:46
		자스에서 넘어온 이 문자열을
		MM-dd-YYYY HH:mm:ss 이렇게 만들어야함
		*/
		
		String fromjs = req.getParameter("voteCloseDt");
		String year = fromjs.substring(0,4);
		String month = fromjs.substring(5,7);
		String day = fromjs.substring(8, 10);
		String hour = fromjs.substring(11, 13);
		String minute = fromjs.substring(14,16);
		String second = "00";
		
		StringBuffer sbCloseDt = new StringBuffer();
		sbCloseDt.append(month + "-" + day + "-" + year + " " + hour + ":" + minute + ":" + second);
		String closeDt = sbCloseDt.toString();
		vote.setVoteCloseDt(closeDt);
		
//		Calendar c = Calendar.getInstance();
//		c.add(c.DAY_OF_MONTH, 2);
//		Date twoDaysLater = c.getTime();
//		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-YYYY HH:mm:ss");
//		String after2day = sdf.format(twoDaysLater);
//		//마감일자 설정부분은 자바스크립트 공부한후에 다시하기
//		System.out.println(after2day);
//		vote.setVoteCloseDt(after2day);
		
//		투표참여인원숫자
		
		dao.insertVote(vote);
		
		res.sendRedirect("votelist.do");
	}

	public static void main(String[] args) {
		String fromjs = "2019-10-03T20:46";
//		String year = fromjs.substring(0,4);
//		System.out.println(year);
	}
}
