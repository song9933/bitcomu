package kr.co.bitcomu.vote.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.User;
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
		int boardPostNo = voteNo;
		List<Comment> cList = dao.selectVoteIn(boardPostNo);
		//투표 메뉴 관련 데이터 가공 처리 시작
		String[] splitedMenu = vote.getVoteMenu().split("★");
		List<String> realMenu = new ArrayList<String>();
		for(String m : splitedMenu) {
//			System.out.println(m);
			if(m.equals("")) continue;
			realMenu.add(m);
//			System.out.print(m + ", ");
		}
		req.setAttribute("realMenu", realMenu);
		req.setAttribute("vote", vote);
		req.setAttribute("cList", cList);
		
		//통계표시에 필요한 데이터 가공 시작
		int menusize = realMenu.size();
	    Map<String, Integer> menuCount = new HashMap<String, Integer>();
		for(int i = 0; i < menusize; i++) {
			int count = 0;
//			System.out.println("씨리스트싸이즈 : " +cList.size());
			
			for(int k = 0; k < cList.size(); k++) {
				String temp = i + "★";
				String data = cList.get(k).getCmtContent();
				if(data != null && data.contains(temp)) {
//					System.out.println(count);
					menuCount.put(realMenu.get(i), ++count);
				}
			}
		}
		req.setAttribute("menuCount", menuCount);
		
		//디테일을 조회하는 유저의 정보를 넘김.
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		req.setAttribute("user", user);
		//현재 디테일을 보려는 유저가 이 투표에 참여한적이 있는지 없는지를 판단해서 보내주는 코드
		if(user != null) {
			Comment com = new Comment();
			com.setUserNo(user.getUserNo());
			com.setBoardPostNo(vote.getVoteNo());
			List<Comment> resultList = dao.selectCommentInVote(com);
//			System.out.println("리절트리시트 투스트링" + resultList.toString());
			if(resultList.size() >= 1) {
				//정상적으로 데이터가 입력된 경우에 유저의 선택을 나타내는 코드
				String userContent = resultList.get(0).getCmtContent();
//				System.out.println(userContent);
				//별을 떼고, 유저의 선택을 한문장으로 정리하기 위한 코드 시작
				String[] sarr = userContent.split("★");
				StringBuffer sbu = new StringBuffer();
				for(int i = 0; i < sarr.length; i++) {
					sbu.append((Integer.parseInt(sarr[i])+1)+"번  ");
				}
				userContent = sbu.toString();
				//담아서 넘기기
				req.setAttribute("userContent", userContent);
				req.setAttribute("commentinvote", "Y");
			} else {
				req.setAttribute("commentinvote", "N");
		}
		}
		
		//DB에 저장된 마감일을 자바스크립트에서 받아들일 수 있는 포맷으로 변경해서 넘기기.
		System.out.println("투표 마감일 : " + vote.getVoteCloseDt());
		
		String closeDt = vote.getVoteCloseDt();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date closeDate = sdf.parse(closeDt);
			sdf.applyPattern("yyyy/MM/dd/HH:mm:ss");
			String jsCloseDate = sdf.format(closeDate);
			System.out.println("자스로 넘기는 스트링 : " + jsCloseDate);
//			long timeDiff = closeDate.getTime() - new Date().getTime();
//			long diffToMinutes = timeDiff / (60 * 1000);
//			System.out.println("시간차를 분단위로 표현 : " + diffToMinutes);
			req.setAttribute("jsCloseDate", jsCloseDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 2019-11-03 18:33:00
		
//		let date = new Date('May 16, 2019 17:22:10');
//		console.log(date); // Thu May 16 2019 17:22:10 GMT+0900 (한국 표준시)
//
//		date = new Date('2019/05/16/17:22:10');
//		console.log(date); // Thu May 16 2019 17:22:10 GMT+0900 (한국 표준시)
		
		// 두날짜의 차이 구하기
		
		
		
//		public void doDiffOfDate(){
//		    String start = "2015-04-01";
//		    String end = "2015-05-05";
//		     
//		    try {
//		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		        Date beginDate = formatter.parse(start);
//		        Date endDate = formatter.parse(end);
//		         
//		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
//		        long diff = endDate.getTime() - beginDate.getTime();
//		        long diffDays = diff / (24 * 60 * 60 * 1000);
//		 
//		        System.out.println("날짜차이=" + diffDays);
//		         
//		    } catch (ParseException e) {
//		        e.printStackTrace();
//		    }

		
		req.getRequestDispatcher("/jsp/vote/votedetail.jsp").forward(req, res);
	}
	
}
