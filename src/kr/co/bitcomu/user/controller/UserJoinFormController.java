package kr.co.bitcomu.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.CodeDAO;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.util.SendEmail;

@WebServlet("/user/userJoinForm.do")
public class UserJoinFormController extends HttpServlet {
	UserDAO dao;
	CodeDAO codedao;
	public UserJoinFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
		this.codedao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CodeDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("mobileList", codedao.selectCode("MOBILE_CD"));
		req.setAttribute("userEmail", req.getParameter("emailAuth").split("@"));
		req.getRequestDispatcher("/jsp/user/user_join.jsp").forward(req, res);
	}
}
