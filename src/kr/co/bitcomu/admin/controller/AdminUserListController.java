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
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;


@WebServlet("/admin/adminUserList.do")
public class AdminUserListController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
	
			throws ServletException, IOException {
		String sPageNo = req.getParameter("pageNo");
		String sPageList = req.getParameter("pageList");
		// 요청 페이지를 1페이지로 변경
		int pageNo = 1;
		int pageList = 10; 
		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		if (sPageList != null) {
			pageList = Integer.parseInt(sPageList);
		}
		Search search = new Search();
		
		search.setSearchType(req.getParameter("searchType"));
		search.setSearchWord(req.getParameter("searchWord"));
		int count = dao.selectUserAdminCount(search);
		
		
		Page page = new Page(pageNo, pageList);
		
		
		
		PageResult pr = new PageResult(pageNo, count);
		
		// 데이터를 구하고 공유
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("search", search);
		
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		req.setAttribute("userList", dao.selectUserAdmin(map));
		req.setAttribute("search", search);
		req.setAttribute("pageList", pageList);
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/admin/admin_user_list.jsp").forward(req, res);
	}
}







