package kr.co.bitcomu.vote.controller;

import java.io.IOException;

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

@WebServlet("/vote/updatevotein.do")
public class VoteInUpdateController extends HttpServlet{
	
	VoteDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	int voteNo;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		System.out.println();
		//로그인한 유저정보를 얻어오기 위해 세션을 호출
		HttpSession session = req.getSession();
		//조건에 맞는 임시 코멘트 객체를 만들기 시작
		Comment comment = new Comment();
		
		//세션으로부터 유저를 받아서 유저 객체 넣음.
		User user = (User)session.getAttribute("user");
		//투표참여 상황은 로그인이 안되어 있을리는 없지만 안전하게 널금지 처리.
		if(user != null) {// 메인 정보입력 시작.
			//로그인한 유저정보 얻어와서 코멘트 유저넘버에 넣음
			comment.setUserNo(user.getUserNo());
			//boardPostNo는 현재 조회중인 투표글의 글번호 동일하게 설정해야함.
			//그러면 현재 이곳에 방금 폼에서 클릭한 그 상세투표화면의 투표번호를 받아와야함.
			//디테일 jsp에 설정된 히든 인풋에서 voteNo 파라미터의 값을 받아온다.
			comment.setBoardPostNo(Integer.parseInt(req.getParameter("voteNo")));
			
			//이 두가지 정보를 이용해서 1개의 코멘트를 확정지어 셀렉
			
			Comment realCom = dao.selectOneVoteIn(comment);
			System.out.println("realCom 투스트링값 : " + realCom.toString());
			//이녀석의 코멘트 콘텐츠를 바꿔줘야함.
			System.out.println("리얼콤의 콘텐츠의 변화전 투스트링 값 :" + realCom.getCmtContent());
			//유저가 선택한 정보값을 받아오기 위해 파라미터에서 배열을 받아옴.
			String[] choice = req.getParameterValues("choice");
			System.out.println(choice.toString());
			StringBuffer sb = new StringBuffer();
			for(String c : choice) {
				System.out.println("초이스로 얻어온 파라미터 밸류 하나하나 : " + c);
				sb.append(c + "★");
			}
			String convertedChoice = sb.toString();	
			realCom.setCmtContent(convertedChoice);
			System.out.println("리얼콤의 콘텐츠의 변화된 투스트링값 :" + realCom.getCmtContent());
			dao.updateVoteIn(realCom);
			
			//이 결과를 받아서 처리할 디테일을 위한 정보 담아 넘기기 작업.
			voteNo = Integer.parseInt(req.getParameter("voteNo"));
//			req.setAttribute("voteNo", voteNo);
		}
		
		res.sendRedirect("votedetail.do?voteNo=" + voteNo);
	}

	
}
