package kr.co.bitcomu.study.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.util.CommUtil;

@WebServlet("/jsp/study/studywrite.do")
public class StudyWriteController extends HttpServlet{
	private StudyDAO dao;

	public StudyWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
		Study study = new Study();	
		study.setUserNo(Integer.parseInt(req.getParameter("userNo")));
		study.setRecruitEnabled(req.getParameter("recruitEnabled"));
		study.setPostTitle(req.getParameter("postTitle"));
		study.setViewCnt(Integer.parseInt(req.getParameter("viewCnt")));
		study.setRegDt(CommUtil.parseDate(req.getParameter("regDt")));
		study.setLoc(req.getParameter("loc"));
		study.setRecruitMem(Integer.parseInt(req.getParameter("recruitMem")));
		study.setRecruitField(req.getParameter("recruitField"));
		study.setPostContent(req.getParameter("postContent"));
		
		dao.insertStudy(study);
		
		} catch (ParseException e) {
			e.printStackTrace();
		}
		res.sendRedirect(req.getContextPath() + "/study/studylist.do");
		
	}
	
	
}
