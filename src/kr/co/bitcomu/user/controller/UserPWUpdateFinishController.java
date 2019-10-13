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

@WebServlet("/user/userPwUpdateFinish.do")
public class UserPWUpdateFinishController extends HttpServlet {
	private UserDAO dao;
	
	public UserPWUpdateFinishController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = new User();
		
		user.setUserId(req.getParameter("id"));
		user.setUserPass(SHA256Password.LockPassword(req.getParameter("password")));
		try {
			dao.updateUserByPassword(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/jsp/user/user_pw_update_finish.jsp").forward(req, res);
	}
}
