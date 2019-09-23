package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.text.ParseException;

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
import kr.co.bitcomu.util.CommUtil;

@WebServlet("/user/userUpdate.do")
public class UserUpdateController extends HttpServlet {
	UserDAO dao;
	/* 로그인 세션 테스트 용 - 테스트 후 삭제 요망 */
	public UserUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			User user = new User();
			user.setUserId(req.getParameter("userId"));
			user.setUserNo(Integer.parseInt(req.getParameter("no")));
			user.setUserName(req.getParameter("name"));
			user.setUserPass(SHA256Password.LockPassword(req.getParameter("password")));
			user.setUserMobile(CommUtil.phoneMerge(req.getParameter("userphone1"), req.getParameter("userphone2"), req.getParameter("userphone3")));
			user.setUserBirth(CommUtil.parseDate(req.getParameter("birth")));
			dao.updateUser(user);
			session.setAttribute("user", dao.selectOneUser(user));
			
		} catch (ParseException e) {
			e.printStackTrace();
			res.sendRedirect("");
		}
		res.sendRedirect(req.getContextPath() + "/user/userUpdateFinish.do");
	}
	
}
