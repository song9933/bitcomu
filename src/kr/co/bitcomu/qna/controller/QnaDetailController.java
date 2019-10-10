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
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/qna/qnadetail.do")
public class QnaDetailController extends HttpServlet{
	
	private QnaDAO dao;
	
	public QnaDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(req.getParameter("qnaNo"));
		
		//조회수 증가
		dao.updateQnaViewCnt(qnaNo);
		
		// 게시글 가져오기
		req.setAttribute("qna", dao.selectOneQna(qnaNo));
		
		// 댓글 목록 가져오기
		req.setAttribute("cmtList", dao.selectCommentList(qnaNo));
		
		// 댓글 수 가져오기
		int qnaCmtCnt = dao.qnaCmtCnt(qnaNo);
		req.setAttribute("qnaCmtCnt", qnaCmtCnt);
		
		req.getRequestDispatcher("/jsp/qna/qna_detail.jsp").forward(req, res);
	}
	
}	
	

