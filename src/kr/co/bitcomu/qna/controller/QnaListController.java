package kr.co.bitcomu.qna.controller;

import java.io.IOException;
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
		
		
		
		// 데이터를 구하고 공유
		req.setAttribute("qna", dao.selectQna(page));
		req.setAttribute("boardNo", req.getParameter("boardNo"));
		
		//검색
		Search search = new Search();
		//검색어 가져오기
		String searchWord = req.getParameter("searchWord");
		if (searchWord == null) searchWord = "%";	
		//검색타입 가져오기
		String searchType = req.getParameter("searchType");
		if (searchType == null) searchType = "qna_no";
				
		search.setSearchType(searchType);
		search.setSearchWord(searchWord);
				
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("page", page);
		listMap.put("search", search);
		
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/qna/qna.jsp").forward(req, res);
	}
}







