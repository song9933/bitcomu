package kr.co.bitcomu.qna.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/qna/qnaList.do")
public class QnaListController extends HttpServlet {
	
	private QnaDAO dao;
	
	public QnaListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res)
		   throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNo = req.getParameter("pageNo");
		
		// 요청 페이지를 1페이지로 변경
		int pageNo = 1;
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		Page page = new Page(pageNo);
		
		
		int cnt = dao.selectQnaCnt();
		PageResult pr = new PageResult(pageNo, cnt);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		List<Qna> list = dao.selectQna(page);
		for (Qna qna : list) {
			List<Comment> c = dao.selectQnaCommentList(qna.getQnaNo());
			qna.setCommentList(c);
			
		}

		req.setAttribute("selBoardNo", req.getParameter("selBoardNo") == null ? 0 : req.getParameter("selBoardNo")); 
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/qna/qna.jsp").forward(req, res);
	}
}







