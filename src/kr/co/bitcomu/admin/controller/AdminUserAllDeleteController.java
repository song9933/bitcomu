package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;


@WebServlet("/admin/userAllDel.do")
public class AdminUserAllDeleteController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserAllDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
		 
		PrintWriter out = res.getWriter();
		
		try {
			dao.deleteAllUserAdmin();
			out.println("success");
		}catch (Exception e) {
			if (e.getMessage().contains("child record found")) {
				out.println("write_exist");
			} else {
				out.println("error");
			}
		}
		
		
		out.close();
		
		
		

		
	}
}







