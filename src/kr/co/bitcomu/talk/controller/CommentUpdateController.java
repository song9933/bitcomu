package kr.co.bitcomu.talk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/talk/comment_update.do")
public class CommentUpdateController extends HttpServlet {

	private TalkDAO dao;
	
	public CommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		response.setContentType("application/json; charset=utf-8");
		
		Comment comment = new Comment();
		System.out.println(request.getParameter("cmtContent"));
		System.out.println(request.getParameter("cmtNo"));
		comment.setCmtContent(request.getParameter("cmtContent"));
		comment.setCmtNo(Integer.parseInt(request.getParameter("cmtNo").trim()));
		dao.updateComment(comment);
		
		/*
		 * response.sendRedirect("/bitcomu/talk/talk_detail.do?postNo=" +
		 * Integer.parseInt(request.getParameter("postNo")) + "&pageNo=" +
		 * Integer.parseInt(request.getParameter("pageNo"))
		 * 
		 * );
		 */
int postNo = Integer.parseInt(request.getParameter("boardPostNo").trim());
		
		String cPageNo = request.getParameter("cmtPageNo");
		
		
		int cmtPageNo = 1;
		if (cPageNo != null) {
			cmtPageNo = Integer.parseInt(cPageNo.trim());
		}
		Page cmtPage = new Page(cmtPageNo);
		
		
		int cmtCount = dao.selectTalkCmtCount(postNo);
		PageResult cpr = new PageResult(cmtPageNo, cmtCount);
		
		
		
		Map<String, Object> commentMap = new HashMap<>();
		commentMap.put("boardPostNo", postNo);
		commentMap.put("cmtPage", cmtPage);
		
		
		// 댓글 목록 공유
		List<Comment> commentList = dao.selectComment(commentMap);
	
		PrintWriter out = response.getWriter();
		out.println(new Gson().toJson(commentList));
		out.println(new Gson().toJson(cpr));
		out.close();
	}
}











