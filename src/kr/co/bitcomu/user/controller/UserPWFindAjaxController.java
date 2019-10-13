package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;
import kr.co.bitcomu.repository.vo.User;
import kr.co.bitcomu.util.CommUtil;
import kr.co.bitcomu.util.SendEmail;

@WebServlet("/user/userPWFindAjax.do")
public class UserPWFindAjaxController extends HttpServlet {
	
	private UserDAO dao;
	
	public UserPWFindAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter(); 
		
		String id = req.getParameter("userId");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String data = "";
		User user = new User();
		
		user.setUserId(id);
		user.setUserEmail(email);
		System.out.println(user);
		try {
			 int result = dao.findUserIdEmail(user);
			 if (result == 0) {
				 out.println(0);
			 }
			 if (result == 1) {
				 new SendEmail(email, "비밀번호 찾기 이메일 인증 코드입니다.", data = CommUtil.randomKeyByPassword());
				 out.println(data);
			 }
		} catch (Exception e) {
			if(e.getMessage().contains("Invalid Addresses")) {
				out.println("Invalid Addresses");
			} else {
				out.println("error");
			}
		}
		 
		 out.close(); 
		 
		 
	}

	
}
