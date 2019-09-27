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

@WebServlet("/onlineclass/onlineclsMain.do")
public class OnlineclsListController extends HttpServlet {
	
	/**
	 * 온라인강의 메인페이지
	 * 2019.09.26
	 * 과목 리스트, 온라인강의 리스트를 가져옴
	 * Onlinecls 객체를 리스트로 가져오면 
	 * 
	 * */
	
	private OnlineclsDAO dao;	
	
	public OnlineclsListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		List<Onlinecls> sList = dao.selectOnlineclsSubject();
		req.setAttribute("sList", sList);
		
//		List<Onlinecls> list = dao.seletOnlinecls();
//		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/jsp/onlineclass/onlineclass_main.jsp").forward(req, res);
	}
}
