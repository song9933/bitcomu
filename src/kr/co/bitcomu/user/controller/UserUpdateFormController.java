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

@WebServlet("/user/userUpdateForm.do")
public class UserUpdateFormController extends HttpServlet {
	UserDAO dao;
	CodeDAO codedao;
	/* 로그인 세션 테스트 용 - 테스트 후 삭제 요망 */
	public UserUpdateFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
		this.codedao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CodeDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		

		
		User user = (User) session.getAttribute("user");
		
		String[] phone = user.getUserMobile().split("-");
		String[] email = user.getUserEmail().split("@");
		req.setAttribute("phone", phone);
		req.setAttribute("email", email);
		req.setAttribute("mobileList", codedao.selectCode("MOBILE_CD"));
		if (user.getUserGrade() == 1) {
			req.getRequestDispatcher("/jsp/user/user_modify.jsp").forward(req, res);
			return;
		} else if (user.getUserGrade() == 3) {
			return;
		}
	}
	
}
