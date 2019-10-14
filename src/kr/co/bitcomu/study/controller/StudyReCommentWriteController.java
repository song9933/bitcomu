package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/study/studyrecommentwrite.do")
public class StudyReCommentWriteController extends HttpServlet{
	private StudyDAO dao;

	public StudyReCommentWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		Comment cmt = new Comment();

		cmt.setUserNo(user.getUserNo());
		cmt.setBoardPostNo(Integer.parseInt(req.getParameter("boardPostNo")));
		//cmt.setCodeValue(Integer.parseInt(req.getParameter("codeValue")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		cmt.setParentCmtNo(Integer.parseInt(req.getParameter("parentCmtNo")));
		
		dao.insertReComment(cmt);
		res.sendRedirect(req.getContextPath() + "/study/studydetail.do?studyPostNo=" + Integer.parseInt(req.getParameter("boardPostNo")));
	}
	
	
}
