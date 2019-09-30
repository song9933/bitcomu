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
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.PageResult;


@WebServlet("/qna/qnaList.do")
public class ListQnaController extends HttpServlet {
	
	private QnaDAO dao;
	
	public ListQnaController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
	
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sPageNo = req.getParameter("qnaNo");
		
		// 요청 페이지를 1페이지로 변경
		int pageNo = 1;
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		Page page = new Page(pageNo);
		
		
		int count = dao.selectQnaCount();
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		
		
		// 데이터를 구하고 공유
		req.setAttribute("notice", dao.selectQna(page));
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/qna/qna.jsp").forward(req, res);
	}
}







