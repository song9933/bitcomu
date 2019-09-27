package kr.co.bitcomu.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.AdminDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/admin/boardAllListForm.do")
public class AdminBoardAllList extends HttpServlet {
	private AdminDAO dao;
	
	public AdminBoardAllList() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
		Page page = new Page(pageNo, pageList);
		
		
		int count = dao.selectAllBoardsCount();
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		// 데이터를 구하고 공유
		req.setAttribute("boardList", dao.selectAllBoards(page));
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/admin/admin_board_list.jsp").forward(req, res);
	}
	
}
