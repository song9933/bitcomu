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
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/study/studywrite.do")
public class StudyWriteController extends HttpServlet{
	private StudyDAO dao;

	public StudyWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Study study = new Study();	
		study.setUserNo(user.getUserNo());
		study.setStudyRecruitEnabled(req.getParameter("studyRecruitEnabled"));
		study.setStudyPostTitle(req.getParameter("studyPostTitle"));
		study.setStudyLoc(req.getParameter("studyLoc"));
		study.setStudyRecruitMemMin(Integer.parseInt(req.getParameter("studyRecruitMemMin")));
		study.setStudyRecruitMemMax(Integer.parseInt(req.getParameter("studyRecruitMemMax")));
		study.setStudyRecruitField(req.getParameter("studyRecruitField"));
		study.setStudyPostContent(req.getParameter("studyPostContent").replace("\r\n", "<br/>"));
		dao.insertStudy(study);

		res.sendRedirect(req.getContextPath() + "/study/studyList.do");
		
	}
	
	
}
