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
		
		// 원본 주소
		ocls.setYtAddr(req.getParameter("yt_addr"));
		// 필요한 파라미터
		ocls.setYtAddrMod(req.getParameter("yt_addr_mod"));
		
		String yt_subject = req.getParameter("yt_subj_sel");
		// selbox가 null이면 input을 저장
		if("0".equals(req.getParameter("yt_subj_sel"))) {
			ocls.setYtSubject(req.getParameter("yt_subj_inp"));
			yt_subject = req.getParameter("yt_subj_inp");
			
		} else {
			ocls.setYtSubject(req.getParameter("yt_subj_sel"));
		}
		
		ocls.setYtSubject(yt_subject);
//		System.out.println("작성자 " + user.getUserNo());
//		System.out.println("제목 " + req.getParameter("yt_title"));
//		System.out.println("내용 " + req.getParameter("yt_detail"));
//		System.out.println("원본주소 " + req.getParameter("yt_addr"));
//		System.out.println("hidden주소 " + req.getParameter("yt_addr_mod"));
//		System.out.println("과목 " + yt_subject);
//		System.out.println("insert결과::" + result);
		
		int resultC = dao.insertOnlinecls(ocls);
		req.setAttribute("resultC", resultC);
		
		
		// url에서 과목명이 깨지는것 처리
		yt_subject = URLEncoder.encode(yt_subject, "utf-8");
//		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + yt_subject + "&resultC=" + result);
		res.sendRedirect(req.getContextPath() + "/onlineclass/onlineclsList.do?subj=" + yt_subject);
	}
}
