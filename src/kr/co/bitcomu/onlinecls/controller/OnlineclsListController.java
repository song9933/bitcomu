package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;

@WebServlet("/onlineclass/onlineclsList.do")
public class OnlineclsListController extends HttpServlet{
	
	private OnlineclsDAO dao;
	
	public OnlineclsListController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String subject = req.getParameter("subj");
		
		List<Onlinecls> list = dao.seletOnlinecls(subject);
		req.setAttribute("list", list);
		
		List<Onlinecls> sList = dao.selectOnlineclsSubject();
		req.setAttribute("sList", sList);
		
		req.getRequestDispatcher("/jsp/onlineclass/onlinecls_list.jsp").forward(req, res);
	}
}
