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
@WebServlet("/onlineclass/p.do")
public class OnlineclsDetailController extends HttpServlet{
	private OnlineclsDAO dao;
		
	public OnlineclsDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		int ytNo = Integer.parseInt(req.getParameter("no"));
		String subject = req.getParameter("subj");
		
		// 온라인강의 상세 조회 (해당 온라인강의 번호로 온라인강의 객체 가져오기)
		Onlinecls ocls = dao.selectOneOnlinecls(ytNo);
		req.setAttribute("ocls", ocls);
		// 해당 온라인강의 회원 아이디 조회
		String userId = dao.selectUserId(ytNo); 
		req.setAttribute("userId", userId); 
		
		// 과목 선택하여 전체 온라인강의 리스트
		List<Onlinecls> list = dao.seletOnlinecls(subject); 
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/jsp/onlineclass/onlinecls_detail.jsp").forward(req, res);
		
	}
}
