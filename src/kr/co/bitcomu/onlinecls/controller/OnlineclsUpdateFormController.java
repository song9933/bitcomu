package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;

@WebServlet("/onlineclass/updateform.do")
public class OnlineclsUpdateFormController extends HttpServlet{
	private OnlineclsDAO dao;
	
	public OnlineclsUpdateFormController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 이전처리를 위해 과목명 파라미터 가져오기
		String subject = req.getParameter("subj");
		req.setAttribute("subject", subject);
		
		// 온라인강의객체 하나 선택하기 위해 ytNo를 넘긴다
		int ytNo = Integer.parseInt(req.getParameter("yt_no"));
		req.setAttribute("no", ytNo);
		
		req.getRequestDispatcher("/onlineclass/yt_update_form.jsp").forward(req, res);
	}
}
