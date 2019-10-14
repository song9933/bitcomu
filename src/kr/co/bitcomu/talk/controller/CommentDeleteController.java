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


@WebServlet("/talk/comment_delete.do")
public class CommentDeleteController extends HttpServlet {

	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		TalkDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
		
		String sPageNo = request.getParameter("pageNo");
		
		
		int pageNo = Integer.parseInt(sPageNo);
		Page page = new Page(pageNo);
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int commentNo = Integer.parseInt(request.getParameter("cmtNo"));
		
		dao.deleteComment(commentNo);
		
		
		
		String cPageNo = request.getParameter("cmtPageNo");
		
		
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
		List<Comment> commentList = dao.selectComment(commentMap);
		
		PrintWriter out = response.getWriter();
		out.println(new Gson().toJson(commentList));
		out.println(new Gson().toJson(cpr));
		out.close();		
	}
}











