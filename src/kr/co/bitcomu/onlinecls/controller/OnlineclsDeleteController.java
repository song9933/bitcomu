package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;

@WebServlet("/onlineclass/delete.do")
public class OnlineclsDeleteController extends HttpServlet{
	private OnlineclsDAO dao;
	
	public OnlineclsDeleteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String subject = req.getParameter("subj");
		int resultD = dao.deleteOnlinecls(Integer.parseInt(req.getParameter("yt_no")));
		req.setAttribute("resultD", resultD);
		
		// url에서 과목명이 깨지는것 처리
		subject = URLEncoder.encode(subject, "utf-8");
//		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + subject + "&resultD=" + resultD);
		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + subject);
	}
}