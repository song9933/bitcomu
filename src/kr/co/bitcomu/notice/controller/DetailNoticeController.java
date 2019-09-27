package kr.co.bitcomu.notice.controller;

import java.io.IOException;
import java.util.List;

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
		
		

		
		String sPageNo = req.getParameter("pageNo");
		
		// 요청 페이지를 1페이지로 변경
		int pageNo = Integer.parseInt(sPageNo);
//		if (sPageNo != null) {
//			pageNo = Integer.parseInt(sPageNo);
//		}
		Page page = new Page(pageNo);
		
		
		int count = dao.selectNoticeCount();
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		// 데이터를 구하고 공유
		req.setAttribute("notice", dao.selectNotice(page));
		
		
		

		
		
		
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("postNo"));
		dao.updateViewCnt(no);
		/*
		Board board = dao.selectOneBoard(no); 
		req.setAttribute("board", board);
		*/
		req.setAttribute("noticeDetail", dao.selectOneNotice(no));
		
		// 댓글 목록 공유
		/*
		 * List<Comment> commentList = dao.selectComment(no);
		 * req.setAttribute("commentList", commentList);
		 */
		
		
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/notice/notice_detail.jsp");
		rd.forward(req, res);
		
		
		
		
		
		
		
		
		
		
	}
}











