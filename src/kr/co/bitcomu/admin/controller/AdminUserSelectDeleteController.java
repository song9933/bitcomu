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
		dao.deleteUserAdmin(list);
		
	}
}







