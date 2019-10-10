package kr.co.bitcomu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.util.CommUtil;
import kr.co.bitcomu.util.SendEmail;

@WebServlet("/user/userEmailAuth.do")
public class UserEmailAjaxController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String data = ""; 
		PrintWriter out = res.getWriter(); 
		 try {
			new SendEmail(req.getParameter("emailAddr"), "회원가입 이메일 인증 코드입니다.", data = CommUtil.randomKey());
			out.println(data);
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
