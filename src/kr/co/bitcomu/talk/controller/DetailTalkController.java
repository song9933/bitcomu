package kr.co.bitcomu.talk.controller;

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
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/talk_detail.do")
public class DetailTalkController extends HttpServlet {

	private TalkDAO dao;
	
	public DetailTalkController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		

		
		String sPageNo = req.getParameter("pageNo");
		
		
		int pageNo = Integer.parseInt(sPageNo);
		Page page = new Page(pageNo);
		
		
		int count = dao.selectTalkCount();
		PageResult pr = new PageResult(pageNo, count);
		req.setAttribute("pr", pr);  // 전체 게시물 갯수
		
		// 데이터를 구하고 공유
		req.setAttribute("talk", dao.selectTalk(page));
		
		
		

		
		
		
		// 게시물 상세 정보 조회하기
		int no = Integer.parseInt(req.getParameter("postNo"));
		dao.updateViewCnt(no);
		/*
		Board board = dao.selectOneBoard(no); 
		req.setAttribute("board", board);
		*/
		req.setAttribute("talkDetail", dao.selectOneTalk(no));
		
		// 댓글 목록 공유
		/*
		 * List<Comment> commentList = dao.selectComment(no);
		 * req.setAttribute("commentList", commentList);
		 */
		
		
		
		
		
		req.setAttribute("comment", dao.selectComment(no));
		
		
		
		
		

		RequestDispatcher rd = req.getRequestDispatcher("/jsp/talk/talk_detail.jsp");
		rd.forward(req, res);
		
	
		
	}
}











