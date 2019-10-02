package kr.co.bitcomu.talk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Comment;


@WebServlet("/talk/comment_regist.do")
public class CommentRegistController extends HttpServlet {

	private TalkDAO dao;
	
	public CommentRegistController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardPostNo = Integer.parseInt(request.getParameter("boardPostNo"));
		
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		Comment comment = new Comment();
		comment.setBoardPostNo(boardPostNo);
		comment.setCmtContent(request.getParameter("cmtContent"));
		comment.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		
		// 게시물 저장 처리 부탁..
		dao.insertComment(comment);
		
			
		
		response.sendRedirect("/bitcomu/talk_detail.do?postNo="+ boardPostNo + "&pageNo=" +request.getParameter("pageNo"));
	}
}











