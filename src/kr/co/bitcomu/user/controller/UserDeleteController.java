package kr.co.bitcomu.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.encrypt.SHA256Password;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/user/userDelete.do")
public class UserDeleteController extends HttpServlet {
	UserDAO dao;
	
	public UserDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		int result = 0;
		if (user.getUserPass().equals(SHA256Password.LockPassword(req.getParameter("password")))) {
			result = dao.deleteUser(Integer.parseInt(req.getParameter("no")));
			if (result == 1) session.invalidate();			
		}
		req.setAttribute("result", result);
		req.getRequestDispatcher("/jsp/user/user_delete_finish.jsp").forward(req, res);
	}
}
