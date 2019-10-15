package kr.co.bitcomu.onlinecls.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/onlineclass/yt_write.do")
public class OnlineclsWriteController extends HttpServlet{
	private OnlineclsDAO dao;
	
	public OnlineclsWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		Onlinecls ocls = new Onlinecls();
		
		// 세션객체를 통해 회원 정보 얻어오기
		HttpSession session = req.getSession();
		User user =(User)session.getAttribute("user");
		ocls.setUserNo(user.getUserNo());
		
		ocls.setYtTitle(req.getParameter("yt_title"));
		ocls.setYtContent(req.getParameter("yt_detail"));
		
		// 주소는 첫번째 파라미터만 커팅한다
//		String targetAddr = req.getParameter("yt_addr");
//		String[] addr = targetAddr.split("\\?v=");
//		String ytAddr = addr[1].split("&")[0];
//		ocls.setYtAddr(ytAddr);
		ocls.setYtAddr(req.getParameter("yt_addr"));
		
		// selbox가 null이면 input을 저장
//		if(req.getParameter("yt_sel") == "") {
//			ocls.setYtSubject(req.getParameter("inp_yt_sel"));
//		} else {
//			ocls.setYtSubject(req.getParameter("yt_sel"));
//		}
		String yt_subject = req.getParameter("yt_sel");
		ocls.setYtSubject(yt_subject);
		int result = dao.insertOnlinecls(ocls);
		
//		System.out.println("insert결과::" + result);
		
		// url에서 과목명이 깨지는것 처리
		yt_subject = URLEncoder.encode(yt_subject, "utf-8");
		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + yt_subject + "&resultC=" + result);
	}
}
