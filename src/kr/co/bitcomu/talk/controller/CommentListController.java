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




@WebServlet("/talk/commentList.do")
public class CommentListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		TalkDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
		int postNo = Integer.parseInt(req.getParameter("postNo"));
		
		String cPageNo = req.getParameter("cmtPageNo");
		
		
		int cmtPageNo = 1;
		if (cPageNo != null) {
			cmtPageNo = Integer.parseInt(cPageNo);
		}
		Page cmtPage = new Page(cmtPageNo);
		
		
		int cmtCount = dao.selectTalkCmtCount(postNo);
		PageResult cpr = new PageResult(cmtPageNo, cmtCount);
		
		
		
		Map<String, Object> commentMap = new HashMap<>();
		commentMap.put("boardPostNo", postNo);
		commentMap.put("cmtPage", cmtPage);
		
		
		// 댓글 목록 공유
		List<Comment> commentList = dao.selectComment(commentMap);
		/*
		 * for (Comment c : commentList) { System.out.println(c); }
		 */
		PrintWriter out = resp.getWriter();
		out.println(new Gson().toJson(commentList));
		out.println(new Gson().toJson(cpr));
		out.close();
	}

}
