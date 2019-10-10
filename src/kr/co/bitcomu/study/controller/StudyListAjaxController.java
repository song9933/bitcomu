package kr.co.bitcomu.study.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.StudyDAO;
import kr.co.bitcomu.repository.vo.Page;

@WebServlet("/study/studyList_ajax.do")
public class StudyListAjaxController extends HttpServlet{
	private StudyDAO dao;
	
	public StudyListAjaxController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json; charset=utf-8"); 
		
		// 요청한 페이지 번호 가져오기
			String sPageNo = req.getParameter("pageNo");
						
		// 요청 페이지를 1페이지로 변경
			int pageNo = 1;
				if (sPageNo != null) {
					pageNo = Integer.parseInt(sPageNo);
					}
				Page page = new Page(pageNo);
				
				
				PrintWriter out = res.getWriter();
				out.println(new Gson().toJson(dao.selectStudyList(page)));
				out.close();
						
	}
	
	
	
}
