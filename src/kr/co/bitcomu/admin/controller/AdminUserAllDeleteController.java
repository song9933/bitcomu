package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.PageResult;


@WebServlet("/admin/userAllDel.do")
public class AdminUserAllDeleteController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserAllDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
		 
		
		
		
		dao.deleteAllUserAdmin();

		
	}
}







