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

@WebServlet("/talk/comment_update.do")
public class CommentUpdateController extends HttpServlet {

	private TalkDAO dao;
	
	public CommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comment comment = new Comment();
		comment.setCmtContent(request.getParameter("cmtContent"));
		comment.setCmtNo(Integer.parseInt(request.getParameter("cmtNo")));
		dao.updateComment(comment);
		
		response.sendRedirect("bitcomu/talk_detail.do?postNo=" + Integer.parseInt(request.getParameter("postNo")));
	}
}











