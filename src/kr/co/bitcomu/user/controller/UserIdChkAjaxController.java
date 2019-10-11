package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.util.CommUtil;
import kr.co.bitcomu.util.SendEmail;

@WebServlet("/user/userIdChk.do")
public class UserIdChkAjaxController extends HttpServlet {
	
	private UserDAO dao;
	
	public UserIdChkAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter(); 
		
		 try {
			 out.println(dao.selectOneUserCheck(req.getParameter("userId")));
		} catch (Exception e) {
			out.println("error");
		}
		 
		 out.close(); 
		 
		 
	}

	
}
