package kr.co.bitcomu.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;


@WebServlet("/admin/adminUserAuthUpdate.do")
public class AdminUserAuthUpdateController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserAuthUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
	
			throws ServletException, IOException {
		User user = new User();
		user.setUserNo(Integer.parseInt(req.getParameter("userNo")));
		int userGrade = Integer.parseInt(req.getParameter("userGrade")) == 1 ? 2 : 1;
		user.setUserGrade(userGrade);
		dao.updateUserAdmin(user);
		
		
		// 사용할 화면으로 이동하기
		res.sendRedirect(req.getContextPath() + "/admin/adminUserList.do?pageNo=" + req.getParameter("pageNo"));
	}
}







