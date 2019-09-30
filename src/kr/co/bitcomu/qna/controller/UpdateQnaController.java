package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/qnaUpdate.do")
public class UpdateQnaController extends HttpServlet {
	
	private QnaDAO dao;
	
	public UpdateQnaController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {	
		
		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		Qna qna = new Qna();
		qna.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
		qna.setQnaTitle(request.getParameter("title"));
		qna.setQnaContent(request.getParameter("content"));
		qna.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		dao.updateQna(qna);
		
		res.sendRedirect("/bitcomu/qna/qnaList.do");
	}
}










