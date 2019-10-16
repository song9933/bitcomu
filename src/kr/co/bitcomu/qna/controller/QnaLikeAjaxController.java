package kr.co.bitcomu.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Qna;

@WebServlet("/qna/QnaLikeAjax.do")
public class QnaLikeAjaxController extends HttpServlet {
	private QnaDAO dao;
	
	public QnaLikeAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String result = "success";
		List<Object> list = new ArrayList<>();
		try {
			Qna qna = new Qna();
			qna.setQnaNo(Integer.parseInt(req.getParameter("qnaNo")));
			qna.setUserNo(Integer.parseInt(req.getParameter("userNo")));
			dao.insertLike(qna);
		} catch (Exception e) {
			if (e.getMessage().contains("unique constraint")) {
				result = "already";
			} else {
				result = "error";
			}
		}
		int likeCnt = dao.selectLike(Integer.parseInt(req.getParameter("qnaNo")));
		list.add(result);
		list.add(likeCnt);
		PrintWriter out = res.getWriter(); 
		out.println(new Gson().toJson(list));
		out.close();
	}

	
}
