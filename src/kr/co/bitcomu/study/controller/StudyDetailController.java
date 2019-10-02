package kr.co.bitcomu.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.dao.UserDAO;

@WebServlet("/study/studydetail.do")
public class StudyDetailController extends HttpServlet{
	StudyDAO dao;
	UserDAO uDao;
	public StudyDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
		//uDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int studyPostNo = Integer.parseInt(req.getParameter("studyPostNo"));
		
		//조회수 증가
		dao.updateViewCnt(studyPostNo);
		
		// 게시글 가져오기
		req.setAttribute("study", dao.selectOneStudy(studyPostNo));
		
		// 댓글 목록 가져오기
		req.setAttribute("cmtList", dao.selectCommentList(studyPostNo));
		
		// 댓글 수 가져오기
		int studyCmtCnt = dao.studyCmtCnt(studyPostNo);
		req.setAttribute("studyCmtCnt", studyCmtCnt);
		
		req.getRequestDispatcher("/jsp/study/study_detail.jsp").forward(req, res);
	}
	
	
	
}
