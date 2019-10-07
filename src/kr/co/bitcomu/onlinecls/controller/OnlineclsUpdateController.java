package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;

@WebServlet("/onlineclass/update.do")
public class OnlineclsUpdateController extends HttpServlet {
	private OnlineclsDAO dao;
			
	public OnlineclsUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String subject = req.getParameter("yt_subject");
		req.setAttribute("subject", subject);
		int no = Integer.parseInt(req.getParameter("ytNo"));
		
		Onlinecls oncls = dao.selectOneOnlinecls(no);
		// 수정된 데이터 set처리
		oncls.setYtTitle(req.getParameter("yt_title"));
		oncls.setYtContent(req.getParameter("yt_detail"));
		// 주소는 첫번째 파라미터만 커팅한다
		String targetAddr = req.getParameter("yt_addr");
		String[] addr = targetAddr.split("\\?v=");
		String ytAddr = addr[1].split("&")[0];
		oncls.setYtAddr(ytAddr);
		int result = dao.updateOnlinecls(oncls);
//		System.out.println("update결과 : " + result);
		
		// url에서 과목명이 깨지는것 처리
		subject = URLEncoder.encode(subject, "utf-8");
		
		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + subject + "&resultU=" + result);
	}
}
