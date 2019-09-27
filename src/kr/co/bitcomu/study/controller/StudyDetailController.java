package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Study;

@WebServlet("/study/studydetail.do")
public class StudyDetailController extends HttpServlet{
	StudyDAO dao;

	public StudyDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int studyPostNo = Integer.parseInt(req.getParameter("studyPostNo"));
		Study study= dao.selectOneStudy(studyPostNo);
		req.setAttribute("study", study);
		req.getRequestDispatcher("/jsp/study/study_detail.jsp").forward(req, res);
	}
	
	
	
}
