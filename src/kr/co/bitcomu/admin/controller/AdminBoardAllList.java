package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.AdminDAO;
import kr.co.bitcomu.repository.dao.CodeDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/admin/boardAllListForm.do")
public class AdminBoardAllList extends HttpServlet {
	private AdminDAO dao;
	private CodeDAO codedao;
	public AdminBoardAllList() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		this.codedao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CodeDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sPageNo = req.getParameter("pageNo");
		String sPageList = req.getParameter("pageList");
		String codeValue = req.getParameter("codeValue");
		
		
		// 요청 페이지를 1페이지로 변경
		int pageNo = 1; 
		int pageList = 10; 
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		if (sPageList != null) {
			pageList = Integer.parseInt(sPageList);
		}
		
		Page page = new Page(pageNo, pageList);
		Search search = new Search();
		
		search.setSearchType(req.getParameter("searchType"));
		search.setSearchWord(req.getParameter("searchWord"));
		int count;
		
		Map<String, Object> map = new HashMap<>();
		
		page.getBegin();
		page.getEnd();
		map.put("page", page);
		map.put("search", search);
		
		if ("all".equals(codeValue) || codeValue == null) {
			count = dao.selectAllBoardsCount(search);
		// 하나의 게시판 조회	
		} else {
			map.put("codeValue", Integer.parseInt(codeValue));
			count = dao.selectOneBoardCount(map);
		}
		
		
		
		
		
		
		
		
		PageResult pr = new PageResult(pageNo, count, pageList, 5);
		
		// 데이터를 구하고 공유
		
		
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		// 전체 게시판 조회
		if ("all".equals(codeValue) || codeValue == null) {
			req.setAttribute("boardList", dao.selectAllBoards(map));
		// 하나의 게시판 조회	
		} else {
			req.setAttribute("boardList", dao.selectOneBoard(map));			
		}
		req.setAttribute("codeValue", codeValue);			
		req.setAttribute("search", search);
		req.setAttribute("pageList", pageList);
		req.setAttribute("boardCode", codedao.selectCode("BOARD_CD"));
		req.getRequestDispatcher("/jsp/admin/admin_board_list.jsp").forward(req, res);
	}
	
}
