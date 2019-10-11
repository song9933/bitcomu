package kr.co.bitcomu.onlinecls.controller;

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
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Comment;

@WebServlet("/onlineclass/cmt_del.do")
public class OnlineclsCommentDeleteController extends HttpServlet {
	private OnlineclsDAO dao;
	
	public OnlineclsCommentDeleteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int cmtNo = Integer.parseInt(req.getParameter("cmtNo"));
		
		
		int result = dao.deleteComment(cmtNo);
//		System.out.println("지워지면1 아니면 0 이겠쥬 : " + result);
		
		// 댓글 목록 공유
		List<Comment> commentList = dao.selectComment(cmtNo);
		Map<String, Object> cmtMap = new HashMap<>();
		cmtMap.put("cmt", commentList);
		cmtMap.put("result", result);
		
		
		
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(cmtMap));
		out.close();
	} 
}
