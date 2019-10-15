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

@WebServlet("/onlineclass/cmt_upd.do")
public class OnlineclsCommentUpdateController extends HttpServlet {

	private OnlineclsDAO dao;
	
	public OnlineclsCommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json; charset=utf-8");
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		
		Comment comment = new Comment();
		comment.setCmtNo(Integer.parseInt(req.getParameter("cmtNo")));
		comment.setCmtContent(req.getParameter("cmtDetail"));
		int result = dao.updateComment(comment);
		
		List<Comment> commentList = dao.selectComment(no);
		
		List<String> cmtUserList = dao.selectCmtUserId(no);
		
		Map<String, Object> cmtMap = new HashMap<>();
		cmtMap.put("cmt", commentList);
		cmtMap.put("cmtUser", cmtUserList);
		cmtMap.put("result", result);
		
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(cmtMap)); 
		out.close();
	}

}

