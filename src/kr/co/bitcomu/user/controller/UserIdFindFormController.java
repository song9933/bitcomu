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
import kr.co.bitcomu.repository.dao.CodeDAO;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;

@WebServlet("/user/userIdFindForm.do")
public class UserIdFindFormController extends HttpServlet {
	private CodeDAO dao;
	
	
	public UserIdFindFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CodeDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("mobileList", dao.selectCode("MOBILE_CD"));
		req.getRequestDispatcher("/jsp/user/user_id_find.jsp").forward(req, res);
	}
}
