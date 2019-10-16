package kr.co.bitcomu.talk.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;


@WebServlet("/talk/talkList.do")
public class ListTalkController extends HttpServlet {
	
	private TalkDAO dao;	
	
	public ListTalkController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		/* res.setCharacterEncoding("utf-8"); */
		String sPageNo = req.getParameter("pageNo");
		
		
		
		
		
		
		
		//검색
		Search search = new Search();
		//검색어 가져오기
		String searchWord = "";
		if (req.getParameter("searchWord") != null)  	
		searchWord = req.getParameter("searchWord");

		//검색타입 가져오기
		String searchType = "talk_post_no";
		if (req.getParameter("searchType") != null) 
		searchType = req.getParameter("searchType");

		search.setSearchType(searchType);
		search.setSearchWord(searchWord);
		
		
		
		// 요청 페이지를 1페이지로 변경
		int pageNo = 1;
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		Page page = new Page(pageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("search", search);
		
		
		int count = dao.selectTalkCount(map);
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		// 데이터를 구하고 공유
		req.setAttribute("talk", dao.selectTalk(map));
		
		//검색어, 타입 보내기
		req.setAttribute("search", search);
		
		
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/talk/talk.jsp").forward(req, res);
	}
}







