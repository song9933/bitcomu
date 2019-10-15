package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;

@WebServlet("/onlineclass/addLike.do")
public class OnlineclsLikeInsertController extends HttpServlet {
	private OnlineclsDAO dao;
	
	public OnlineclsLikeInsertController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class); 
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		int userNo = Integer.parseInt(req.getParameter("userNo"));
		
		Onlinecls ocls = new Onlinecls();
		
		ocls.setYtNo(no);
		ocls.setUserNo(userNo);
		String result="success";
		try {
			dao.insertLike(ocls);
		} catch (Exception e) {
			if (e.getMessage().contains("unique constraint")) {
				result = "already";
			} else {
				result = "error";
			}
		}
		
		PrintWriter out = res.getWriter();
		out.println(result);
		out.close();

	}

}
