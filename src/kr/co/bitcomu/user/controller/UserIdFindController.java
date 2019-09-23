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
import kr.co.bitcomu.util.CommUtil;

@WebServlet("/user/userIdFind.do")
public class UserIdFindController extends HttpServlet {
	private UserDAO dao;
	
	public UserIdFindController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = new User();
		user.setUserMobile(CommUtil.phoneMerge(req.getParameter("userphone1"), req.getParameter("userphone2"), req.getParameter("userphone3")));
		user.setUserEmail(CommUtil.emailMerge(req.getParameter("email1"), req.getParameter("email2")));
		user.setUserName(req.getParameter("userName"));
		req.setAttribute("userId", dao.selectFindUser(user));
		
		
		req.getRequestDispatcher("/jsp/user/user_id_find_finish.jsp").forward(req, res);
	}
}
