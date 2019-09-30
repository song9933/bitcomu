package kr.co.bitcomu.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/qna/write.do")
public class WriteQnaController extends HttpServlet {
	private QnaDAO dao;
	public WriteQnaController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		req.setAttribute("user", user);
		
		Qna q = new Qna();
			
		q.setQnaTitle(req.getParameter("title"));
		q.setQnaContent(req.getParameter("content"));
		q.setUserNo(user.getUserNo());
		dao.insertQna(q);
		res.sendRedirect("qnaList.do");
	}
}














