package kr.co.bitcomu.talk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Notice;
import kr.co.bitcomu.repository.vo.Talk;
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/talkUpdate.do")
public class UpdateTalkController extends HttpServlet {
	
	private TalkDAO dao;
	
	public UpdateTalkController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		
		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		Talk talk = new Talk();
		talk.setPostNo(Integer.parseInt(request.getParameter("postNo")));
		talk.setTitle(request.getParameter("title"));
		talk.setContent(request.getParameter("content"));
		talk.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		dao.updateTalk(talk);
		
		
		

		res.sendRedirect("/bitcomu/talk/talkList.do");
	}
}










