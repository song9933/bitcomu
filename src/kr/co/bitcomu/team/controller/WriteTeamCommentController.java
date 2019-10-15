package kr.co.bitcomu.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/team/teamCommentWrite.do")
public class WriteTeamCommentController extends HttpServlet{
	private TeamDAO dao;

	public WriteTeamCommentController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Comment cmt = new Comment();

		cmt.setUserNo(user.getUserNo());
		cmt.setBoardPostNo(Integer.parseInt(req.getParameter("teamBoardNo")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		
		dao.insertTeamComment(cmt);
		res.sendRedirect(req.getContextPath() + "/team/teamBoardDetail.do?teamBoardNo=" + Integer.parseInt(req.getParameter("teamBoardNo")));
	
//		// 댓글 목록 공유
//		int cmtNo = Integer.parseInt(req.getParameter("cmtNo"));
//		List<Comment> commentList = dao.selectTeamComment(cmtNo);
//
//		PrintWriter out = res.getWriter();
//		out.println(new Gson().toJson(commentList));
//		out.close();
	}
	
	
}
