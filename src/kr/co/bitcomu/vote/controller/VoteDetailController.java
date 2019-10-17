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
import kr.co.bitcomu.repository.dao.UserDAO;
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
	
	private UserDAO udao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//디테일이 리스트에서 클릭해서 들어왔는지, 투표하기나 업데이트하기 한후에 뿌려주는지에 따라 voteNo를 받아오는 방식이 분기된다.
		//이걸 판단하는 기준은 getAttribute를 해서 null이 넘어왔다면 투표하기나 재투표하기로 뿌려주는 상황이 아니라는 것이고
		//null 넘어오지 않았다면 넘어온 voteNo를 그대로 사용하면 된다. 사실 모든 경우의수를 따지니까 굳이 복잡하게 생각할 필요도 없다.
		//그냥 null넘어오면 설정못했으니까 파라미터에서 얻고, 제대로 넘어왔다면 그냥 그걸로 사용하면 그만인셈.
		int voteNo;
		if(req.getAttribute("voteNo") != null) {
			voteNo = Integer.parseInt((String)req.getAttribute("voteNo"));
		} else {
			voteNo = Integer.parseInt(req.getParameter("voteNo"));
		}

		Vote vote = dao.selectOneVote(voteNo);
		int boardPostNo = voteNo;
		List<Comment> cList = dao.selectVoteIn(boardPostNo);
		//투표 메뉴 관련 데이터 가공 처리 시작
		String[] splitedMenu = vote.getVoteMenu().split("★");
		List<String> realMenu = new ArrayList<String>();
		for(String m : splitedMenu) {
			if(m.equals("")) continue;
			realMenu.add(m);
		}
		req.setAttribute("realMenu", realMenu);
		req.setAttribute("vote", vote);
		req.setAttribute("cList", cList);
		
		//통계표시에 필요한 데이터 가공 시작(참여자들 이름 출력 추가버전)
		int menusize = realMenu.size();
		Map<String, Integer> menuCount = new HashMap<String, Integer>();
	    Map<String, String> choicedPeople = new HashMap<String, String>();
//	    List<String> userNames = new ArrayList<String>();
	    for(int i = 0; i < menusize; i++) {
			int count = 0;
			
			StringBuffer userNames = new StringBuffer();
			for(int k = 0; k < cList.size(); k++) {
				String temp = i + "★";
				String data = cList.get(k).getCmtContent();
				if(data != null && data.contains(temp)) {
					menuCount.put(realMenu.get(i), ++count);
					int choicedUserNo = cList.get(k).getUserNo();
					String userName = dao.selectOneUserName(choicedUserNo);
					userNames.append(userName + " ");
				}
			}
			choicedPeople.put(realMenu.get(i), userNames.toString());
			
			
		}
		req.setAttribute("menuCount", menuCount);
		req.setAttribute("choicedPeople", choicedPeople);
		
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
			if(resultList.size() >= 1) {
				//정상적으로 데이터가 입력된 경우에 유저의 선택을 나타내는 코드
				String userContent = resultList.get(0).getCmtContent();
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
		
		String closeDt = vote.getVoteCloseDt();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date closeDate = sdf.parse(closeDt);
			sdf.applyPattern("yyyy/MM/dd/HH:mm:ss");
			String jsCloseDate = sdf.format(closeDate);
			req.setAttribute("jsCloseDate", jsCloseDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/jsp/vote/votedetail.jsp").forward(req, res);
	}
	
}
