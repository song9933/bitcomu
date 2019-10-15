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
import kr.co.bitcomu.repository.vo.Qna;

@WebServlet("/qna/qnasearchajax.do")
public class QnaSearchAjaxController extends HttpServlet{
	QnaDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		Qna qna = new Qna();
		String keyword = req.getParameter("keyword");
		qna.setQnaKeyword(keyword);
		int qnaListCount = (Integer.parseInt(req.getParameter("pageno")))*7;
		qna.setQnaListCount(qnaListCount);
		List<Qna> list;
		if(qnaListCount < 7) {
			list = dao.selectQnaSearchAjaxSmall(qna);
		} else {
			list = dao.selectQnaSearchAjax(qna);
		}
		
		for(Qna q : list) {
			q.setUserId(dao.selectUserId(q.getQnaNo()));
			System.out.println("큐엔에이 하나하나들" + q.toString());
		}
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(list));
		out.close();
	}

	
}
