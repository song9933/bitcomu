package kr.co.bitcomu.onlinecls.controller;

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

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.util.PageResult;

@WebServlet("/onlineclass/onlineclsAjaxList.do")
public class OnlineclsListAjaxController extends HttpServlet{
	
	private OnlineclsDAO dao;
	
	public OnlineclsListAjaxController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String subject = req.getParameter("subj");
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("subj", subject);
		// 과목(->map 중 과목) 선택하여 전체 온라인강의 리스트
		List<Onlinecls> list = dao.selectOnlineclsList(map);
		
		// 탭전환하여 전체 과목 목록
		List<Onlinecls> sList = dao.selectOnlineclsSubject();
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("listAjax", list);
		map2.put("sListAjax", sList);
		
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(map2));
		out.close();
	}
}
