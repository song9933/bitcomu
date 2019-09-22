package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.encrypt.SHA256Password;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.CommUtil;

@WebServlet("/user/userJoin.do")
public class UserJoinController extends HttpServlet {
	private UserDAO dao;
	
	public UserJoinController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			User user = new User();
			user.setUserId(req.getParameter("id"));
			user.setUserName(req.getParameter("name"));
			user.setUserPass(SHA256Password.LockPassword(req.getParameter("password")));
			user.setUserMobile(req.getParameter("userphone1") + "-" + req.getParameter("userphone2") + "-" + req.getParameter("userphone3"));
			user.setUserEmail(req.getParameter("email1") + "@" + req.getParameter("email2"));
			user.setUserBirth(CommUtil.parseDate(req.getParameter("birth")));
			dao.insertUser(user);
		} catch (ParseException e) {
			e.printStackTrace();
			res.sendRedirect("");
		}
		res.sendRedirect("../user/userJoinFinish.do");
		
			

	}

}
