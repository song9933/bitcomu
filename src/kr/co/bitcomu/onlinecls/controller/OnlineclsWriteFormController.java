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

/***
 * 2019.10.01
 * @author 유지인
 * 작성 폼 페이지로 이동만 처리
 */

@WebServlet("/onlineclass/ytwriteform.do")
public class OnlineclsWriteFormController extends HttpServlet {
	private OnlineclsDAO dao;
	
	public OnlineclsWriteFormController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 뒤로가기 처리하기위해 과목명 파라미터 가져오기
		String subject = req.getParameter("subj");
		req.setAttribute("subject", subject);
		
		// 과목선택 시 option을 반복해야하함
		List<Onlinecls> sList = dao.selectOnlineclsSubject();
		req.setAttribute("sList", sList);
		
		req.getRequestDispatcher("/jsp/onlineclass/yt_upload_form.jsp").forward(req, res);
	}  
}
