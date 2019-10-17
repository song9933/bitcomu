package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/onlineclass/onlineclsList.do")
public class OnlineclsListController extends HttpServlet{
	
	private OnlineclsDAO dao;
	
	public OnlineclsListController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String subject = req.getParameter("subj");
		req.setAttribute("subject", subject);
		// 페이징&검색
		// 요청한 페이지 번호 가져오기
		String sPageNo = req.getParameter("pageNo");
		String sPageList = req.getParameter("pageList");
		
		// 요청한 페이지를 1로 초기화
		int pageNo = 1;
//		int pageList = 10;
		int pageList = 8;
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		} 
		if (sPageList != null) {
			pageList = Integer.parseInt(sPageList);
		}
		Page page = new Page(pageNo, pageList);
		
		
		// 검색
		Search search = new Search();
		
		search.setSearchType(req.getParameter("searchType"));
		search.setSearchWord(req.getParameter("searchWord"));
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("page", page);
		map.put("search", search);
		map.put("subj", subject);
		// 과목(->map 중 과목) 선택하여 전체 온라인강의 리스트
		List<Onlinecls> list = dao.selectOnlineclsList(map);

		req.setAttribute("search", search);
		req.setAttribute("pageList", pageList);
		// ----------------------- 페이징&검색

		
		// 과목 선택하여 전체 온라인강의 리스트
		req.setAttribute("list", list);
		// 탭전환하여 전체 과목 목록
		List<Onlinecls> sList = dao.selectOnlineclsSubject();
		req.setAttribute("sList", sList);
		
		// 삽입, 수정, 삭제 결과값에 따른 alert창 처리를 위함
		req.setAttribute("resultC", req.getParameter("resultC"));
		req.setAttribute("resultU", req.getParameter("resultU"));
		req.setAttribute("resultD", req.getParameter("resultD"));
		
		// 검색 & 페이징
		int count = dao.selectOnlineclsCount(map);
		PageResult pr = new PageResult(pageNo, count, pageList, 5);
		req.setAttribute("pr", pr); // 전체 게시물 갯수
		
		req.getRequestDispatcher("/jsp/onlineclass/onlinecls_list.jsp").forward(req, res);
	}
}
