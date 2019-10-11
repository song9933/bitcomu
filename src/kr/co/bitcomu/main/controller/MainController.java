package kr.co.bitcomu.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Study;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private StudyDAO studyDao;
	
	
	public MainController() {
		studyDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<Study> studyList = studyDao.mainStudyPost();
		req.setAttribute("studyList", studyList);
	
		req.getRequestDispatcher("/jsp/main.jsp").forward(req, res);
	}
	
}
