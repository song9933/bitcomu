package kr.co.bitcomu.talk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Page;


@WebServlet("/talk/comment_delete.do")
public class CommentDeleteController extends HttpServlet {

	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TalkDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
		
		String sPageNo = request.getParameter("pageNo");
		
		
		int pageNo = Integer.parseInt(sPageNo);
		Page page = new Page(pageNo);
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int commentNo = Integer.parseInt(request.getParameter("cmtNo"));
		
		dao.deleteComment(commentNo);
		
		response.sendRedirect("/bitcomu/talk/talk_detail.do?postNo="+ postNo + "&pageNo="+ pageNo);
		
	}
}











