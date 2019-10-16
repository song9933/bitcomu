package kr.co.bitcomu.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.dao.VoteDAO;
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.repository.vo.Vote;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private StudyDAO studyDao;
	
	
	public MainController() {
		studyDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	private VoteDAO voteDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<Study> studyList = studyDao.mainStudyPost();
		req.setAttribute("studyList", studyList);
		List<Vote> voteList = voteDao.selectVote();
		req.setAttribute("voteList", voteList);
	
		req.getRequestDispatcher("/jsp/main.jsp").forward(req, res);
	}
	
}
