package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.AdminDAO;

@WebServlet("/admin/boardSelectAllDel.do")
public class AdminBoardSelAllDelAjaxController extends HttpServlet{
	private AdminDAO dao;
	
	public AdminBoardSelAllDelAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		
		PrintWriter out = res.getWriter();
		
		try {
			dao.delSelAllBoard(Integer.parseInt(req.getParameter("delSelAllBoard")));
			out.println("success");
		} catch (Exception e) {
			e.printStackTrace();
			out.println("fail");
		}
		out.close();
		
	}
	
}
