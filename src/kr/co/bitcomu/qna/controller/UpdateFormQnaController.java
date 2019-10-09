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
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/qna/updateQnaForm.do")
public class UpdateFormQnaController extends HttpServlet {

	private QnaDAO dao;
	
	public UpdateFormQnaController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		req.setAttribute("user", user);
		
		req.setAttribute(
			"board", dao.selectOneQna(Integer.parseInt(req.getParameter("qnaNo")))
		);
		req.getRequestDispatcher("/jsp/qna/qna.jsp").forward(req, res);
	}
}











