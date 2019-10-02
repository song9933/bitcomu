package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;

@WebServlet("/study/studyupdateform.do")
public class StudyUpdateFormController extends HttpServlet{
	private StudyDAO dao;

	public StudyUpdateFormController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int studyPostNo = Integer.parseInt(req.getParameter("studyPostNo"));
		req.setAttribute("study", dao.selectOneStudy(studyPostNo));
		req.getRequestDispatcher("/jsp/study/study_update.jsp").forward(req, res);
	}
	
	
}
