package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Qna;


@WebServlet("/qna/qnaDetail.do")
public class QnaDetailController extends HttpServlet{
	
	private QnaDAO dao;
	
	public QnaDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("qnaNo"));
		Qna q =  dao.selectOneQna(no);
		req.setAttribute("qna", q);
		
		// 댓글
		req.setAttribute("qnaCmt", dao.selectQnaCommentList(no));
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/qna/qna_detail.jsp");
		rd.forward(req, res);
	}	
}	
	

