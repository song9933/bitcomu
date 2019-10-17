package kr.co.bitcomu.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Qna;


@WebServlet("/qna/qnalistajax.do")
public class QnaListAjaxController extends HttpServlet{
	private QnaDAO dao;
	
	public QnaListAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	




	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/json; charset=utf-8");
		int rnum = (Integer.parseInt(req.getParameter("pageno")))*7;
		List<Qna> list;
		if(rnum < 7) {
			list = dao.selectQnaNSmall(rnum);
		} else {
			list = dao.selectQnaN(rnum);
		}
		
		for(Qna q : list) { q.setUserId(dao.selectUserId(q.getQnaNo()));
				q.setQnaLikeCnt(dao.selectLike(q.getQnaNo()));
		}
		for (Qna qna : list) {
			List<Comment> c = dao.selectQnaCommentList(qna.getQnaNo());
			qna.setCommentList(c);
			
		} 
		
		PrintWriter out = res.getWriter();
		
		out.println(new Gson().toJson(list));
		
		// System.out.println(new Gson().toJson(list));
		out.close();
	}
	
}
