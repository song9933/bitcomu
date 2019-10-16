package kr.co.bitcomu.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/notice_detail.do")
public class DetailNoticeController extends HttpServlet {

	private NoticeDAO dao;
	
	public DetailNoticeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(NoticeDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		

		
		
		//리스트
		String sPageNo = req.getParameter("pageNo");
		int pageNo = Integer.parseInt(sPageNo);
		Page page = new Page(pageNo);
		
		
		
		//검색
		Search search = new Search();
		//검색어 가져오기
		String searchWord = req.getParameter("searchWord");
		if (searchWord == null) searchWord = "%";	
		//검색타입 가져오기
		String searchType = req.getParameter("searchType");
		if (searchType == null) searchType = "talk_post_no";
		
		search.setSearchType(searchType);
		search.setSearchWord(searchWord);
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("page", page);
		listMap.put("search", search);
		
		
		int count = dao.selectNoticeCount(listMap);
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		
		
		// 데이터를 구하고 공유
		req.setAttribute("notice", dao.selectNotice(listMap));
	
		
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("postNo"));
		dao.updateViewCnt(no);
		req.setAttribute("noticeDetail", dao.selectOneNotice(no));
		
		
		
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/notice/notice_detail.jsp");
		rd.forward(req, res);
		
		
		
		
		
		
		
		
		
		
	}
}











