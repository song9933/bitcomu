package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;

@WebServlet("/study/studydelete.do")
public class StudyDeleteController extends HttpServlet{
	private StudyDAO dao;

	public StudyDeleteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteStudy(Integer.parseInt(req.getParameter("studyPostNo")));
		res.sendRedirect(req.getContextPath() + "/study/studyList.do");
	}
	
	
	
	
}
