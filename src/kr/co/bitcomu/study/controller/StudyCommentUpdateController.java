package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Comment;

@WebServlet("/study/studycommentupdate.do")
public class StudyCommentUpdateController extends HttpServlet{
	private StudyDAO dao;

	public StudyCommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Comment cmt = new Comment();
		cmt.setCmtNo(Integer.parseInt(req.getParameter("cmtNo")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		
		dao.updateComment(cmt);
		
		res.sendRedirect(req.getContextPath() + "/study/studydetail.do?studyPostNo=" + req.getParameter("studyPostNo"));
	}
	
	
}
