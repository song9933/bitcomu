package kr.co.bitcomu.admin.controller;

import java.io.IOException;

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


@WebServlet("/admin/adminUserDelete.do")
public class AdminUserDeleteController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
	
			throws ServletException, IOException {
		dao.deleteUser(Integer.parseInt(req.getParameter("userNo")));
		
		// 사용할 화면으로 이동하기
		res.sendRedirect(req.getContextPath() + "/admin/adminUserList.do?pageNo=" + req.getParameter("pageNo"));
	}
}







