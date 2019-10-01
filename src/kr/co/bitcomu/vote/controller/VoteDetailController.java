package kr.co.bitcomu.vote.controller;

import java.io.IOException;
import java.util.ArrayList;
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
		
		
		
		req.getRequestDispatcher("/jsp/vote/votedetail.jsp").forward(req, res);
	}
	
}
