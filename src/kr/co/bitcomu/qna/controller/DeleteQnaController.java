package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;

@WebServlet("/qna/qnaDelete.do")
public class DeleteQnaController extends HttpServlet {
	
	private QnaDAO dao;
	
	public DeleteQnaController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 데이터베이스 처리하기
		dao.deleteQna(Integer.parseInt(req.getParameter("qnaNo"))); 
		res.sendRedirect("/bitcomu/qna/qnaList.do");
	}
}











