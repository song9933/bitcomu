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

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.QnaDAO;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.util.CommUtil;
import kr.co.bitcomu.util.SendEmail;

@WebServlet("/qna/QnaViewCntAjax.do")
public class QnaViewCntAjaxController extends HttpServlet {
	private QnaDAO dao;
	
	public QnaViewCntAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QnaDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		List<Integer> list = new ArrayList<>();
		
		list.add(dao.updateViewCntQna(Integer.parseInt(req.getParameter("qnaNo"))));
		list.add(dao.selectViewCntQna(Integer.parseInt(req.getParameter("qnaNo"))));
		
		PrintWriter out = res.getWriter(); 

		out.println(list);
		out.close();
		 
		 
	}

	
}
