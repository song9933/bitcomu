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
import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/qna/qnaCommentWrite.do")
public class QnaCommentWriteController extends HttpServlet{
	private QnaDAO dao;

	public QnaCommentWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		Comment cmt = new Comment();

		cmt.setUserNo(user.getUserNo());
		cmt.setBoardPostNo(Integer.parseInt(req.getParameter("boardPostNo")));
		cmt.setCmtContent(req.getParameter("cmtContent"));
		
		dao.insertQnaComment(cmt);
		res.sendRedirect(req.getContextPath() + "/qna/qnaDetail.do?qnaNo=" + Integer.parseInt(req.getParameter("boardPostNo")));
	}
	
	
}
