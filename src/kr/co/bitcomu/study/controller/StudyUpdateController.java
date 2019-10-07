package kr.co.bitcomu.study.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.util.CommUtil;

@WebServlet("/study/studyupdate.do")
public class StudyUpdateController extends HttpServlet {
	private StudyDAO dao;

	public StudyUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

			Study study = new Study();
			study.setStudyPostNo(Integer.parseInt(req.getParameter("studyPostNo")));
			study.setStudyRecruitEnabled(req.getParameter("studyRecruitEnabled"));
			study.setStudyRecruitField(req.getParameter("studyRecruitField"));
			study.setStudyPostTitle(req.getParameter("studyPostTitle"));
			study.setStudyLoc(req.getParameter("studyLoc"));
			study.setStudyRecruitMemMin((Integer.parseInt(req.getParameter("studyRecruitMemMin"))));
			study.setStudyRecruitMemMax((Integer.parseInt(req.getParameter("studyRecruitMemMax"))));
			study.setStudyPostContent(req.getParameter("studyPostContent"));
			

			dao.updateStudy(study);
		res.sendRedirect(req.getContextPath() + "/study/studydetail.do?studyPostNo="+Integer.parseInt(req.getParameter("studyPostNo")));

	}

}
