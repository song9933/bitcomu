package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;

@WebServlet("/study/studycommentdelete.do")
public class StudyCommentDeleteController extends HttpServlet {
	private StudyDAO dao;

	public StudyCommentDeleteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteComment(Integer.parseInt(req.getParameter("cmtNo")));
		res.sendRedirect(req.getContextPath() + "/study/studydetail.do?studyPostNo=" + req.getParameter("studyPostNo"));
		
	}
	
	
	
	
	
}
