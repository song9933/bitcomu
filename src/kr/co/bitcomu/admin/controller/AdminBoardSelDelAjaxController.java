package kr.co.bitcomu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.AdminDAO;
import kr.co.bitcomu.util.HashMapDeserializer;

@WebServlet("/admin/boardSelectDel.do")
public class AdminBoardSelDelAjaxController extends HttpServlet{
	private AdminDAO dao;
	
	public AdminBoardSelDelAjaxController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Gson gson = new GsonBuilder().registerTypeAdapter(HashMap.class, new HashMapDeserializer()).create();
		Map<String, List<Integer>> list = gson.fromJson(req.getParameter("data"), new TypeToken<Map<String, List<Integer>>>() {}.getType());
		
		
		PrintWriter out = res.getWriter();
		
		try {
			dao.delSelBoard(list);
			out.println("success");
		} catch (Exception e) {
			e.printStackTrace();
			out.println("fail");
		}
		out.close();
		
	}
	
}
