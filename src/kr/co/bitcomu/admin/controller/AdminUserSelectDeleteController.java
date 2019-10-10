package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;


@WebServlet("/admin/userSelectDel.do")
public class AdminUserSelectDeleteController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserSelectDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
		 
		List<String> asList = Arrays.asList(req.getParameter("msg").split(","));
		List<Integer> list = new ArrayList<>();
		for (String as : asList) {
			list.add(Integer.parseInt(as));
		}
		
		PrintWriter out = res.getWriter();
		
		try {
			dao.deleteUserAdmin(list);
			out.println("success");
		}catch (Exception e) { 
			e.printStackTrace(); 
			if (e.getMessage().contains("child record found")) {
				
				out.println("write_exist");
			} else {
				out.println("error");
			}
		}
		
		
		out.close();
		
		
	}
}







