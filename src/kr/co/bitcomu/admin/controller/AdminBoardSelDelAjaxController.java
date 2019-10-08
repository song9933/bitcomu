package kr.co.bitcomu.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/admin/boardSelectDel.do")
public class AdminBoardSelDelAjaxController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		System.out.println(new Gson().(req.getParameter("data")));
//		System.out.println(new Gson().toJson(req.getParameter("data")));
		
		
	}
	
}
