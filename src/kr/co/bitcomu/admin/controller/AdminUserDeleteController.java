package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.UserDAO;


@WebServlet("/admin/adminUserDelete.do")
public class AdminUserDeleteController extends HttpServlet {
	
	private UserDAO dao;
	
	public AdminUserDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) 
	
			throws ServletException, IOException {
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = null;
		try {
			dao.deleteUser(Integer.parseInt(req.getParameter("userNo")));
		} catch (Exception e) {
			if (e.getMessage().contains("child record found")) {
				out = res.getWriter();
				out.println("<script>alert('해당 유저의 게시글이 존재합니다. 게시글 삭제 후 유저 삭제를 진행해주세요.');"
						+ "location.href='" + req.getContextPath() + "/admin/adminUserList.do?pageNo=" + req.getParameter("pageNo") +"'"
						+ "</script>");
				out.close();
				return;
			} else {
				out = res.getWriter();
				out.println("<script>alert('시스템 오류입니다.');"
						+ "location.href='" + req.getContextPath() + "/admin/adminUserList.do?pageNo=" + req.getParameter("pageNo") + "'"
						+ "</script>");
				out.close();
				return;
			}
			
		}
		
		// 사용할 화면으로 이동하기
		res.sendRedirect(req.getContextPath() + "/admin/adminUserList.do?pageNo=" + req.getParameter("pageNo"));
	}
}







