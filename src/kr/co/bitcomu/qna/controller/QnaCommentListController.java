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
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Qna;


@WebServlet("/qna/qnaCommentList.do")
public class QnaCommentListController extends HttpServlet{
	
	private QnaDAO dao;
	
	public QnaCommentListController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("boardPostNo"));
		
		Comment cmt = new Comment();
		cmt.setBoardPostNo(no);
		cmt.setCmtContent(req.getParameter("cmtContent"));
		cmt.setUserNo(Integer.parseInt(req.getParameter("userNo")));
		
		// 게시물 저장
		dao.insertQnaComment(cmt);
		
			
		
		res.sendRedirect(req.getContextPath() +"/qna/qnaList.do?boardNo=" + no);
	}
}	
	

