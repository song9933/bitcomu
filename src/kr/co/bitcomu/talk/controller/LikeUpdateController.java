package kr.co.bitcomu.talk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Like;
import kr.co.bitcomu.repository.vo.Talk;

@WebServlet("/talk/like_update.do")
public class LikeUpdateController extends HttpServlet{
	private TalkDAO dao; 
		
	public LikeUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		Talk talk = new Talk();
		Map<String, Object> map = new HashMap<>();
		map.put("boardPostNo", Integer.parseInt(req.getParameter("postNo")));
		map.put("userNo", Integer.parseInt(req.getParameter("userNo")));
		
		dao.insertTalkLikeCount(map);
		
		
//		Like like = new Like();
//		like.setBoardPostNo(Integer.parseInt(req.getParameter("postNo")));
//		like.setUserNo(Integer.parseInt(req.getParameter("userNo")));
		 
//		talk.setLikeCnt(dao.selectTalkLikeCount(Integer.parseInt(req.getParameter("postNo"))));
		PrintWriter out = resp.getWriter();
		try {
			dao.updateLikeCnt(Integer.parseInt(req.getParameter("postNo")));			
		} catch (Exception e) {
			if (e.getMessage().contains("unique constraint")) {
				out.println("error");
				return;
			}
		}
		
		int cnt = dao.selectTalkLikeCount(Integer.parseInt(req.getParameter("postNo")));
	
		out.println(cnt);
		
//		resp.sendRedirect("/bitcomu/talk_detail.do?postNo=" + Integer.parseInt(req.getParameter("postNo")) 
//		  									   + "&pageNo=" + Integer.parseInt(req.getParameter("pageNo")) 
//		
//);
	}
	
	
	
	
}
