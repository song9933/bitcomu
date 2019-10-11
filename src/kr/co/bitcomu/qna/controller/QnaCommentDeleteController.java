package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;

@WebServlet("/qna/qnaCommentDelete.do")
public class QnaCommentDeleteController extends HttpServlet {
	private QnaDAO dao;

	public QnaCommentDeleteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteQnaComment(Integer.parseInt(req.getParameter("cmtNo")));
		res.sendRedirect(req.getContextPath() + "/qna/qnaDetail.do?qnaNo=" + req.getParameter("qnaNo"));
		
	}
	
	
	
	
	
}
