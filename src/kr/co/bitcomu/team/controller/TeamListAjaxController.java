package kr.co.bitcomu.team.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
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
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Team;

@WebServlet("/team/teamBoardList_ajax.do")
public class TeamListAjaxController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/json; charset=utf-8");
		
		TeamDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
		
		// 페이징처리
		
		String sPageNo = req.getParameter("pageNo");
		
		// 요청 페이지를 1페이지로 변경
			int pageNo = 1;
//			int pageNo = Integer.parseInt(req.getParameter("pagenum"));
//				int listSize = dao.selectBoardCount();
				int pageList = 8; 
			if (sPageNo != null) {
				pageNo = Integer.parseInt(sPageNo);
			}
//				if (sPageList != null) {
//					pageList = Integer.parseInt(sPageList);
//				}
				
			Page page = new Page(pageNo , pageList);
			Team team = new Team();
			team.setProjectNo(Integer.parseInt(req.getParameter("projectNo")));
			team.setTeamNo(Integer.parseInt(req.getParameter("teamNo")));
			
			Map<String, Object> map = new HashMap<>();
			map.put("t", team);
			map.put("p", page);
			List<Team> teamList = dao.selectTeamBoard(map);
		
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(teamList));
		out.close();
		
//		int pageNo = 1;
//		int pageNo = Integer.parseInt(req.getParameter("pagenum"));
//		if (sPageNo != null) {
//			pageNo = Integer.parseInt(sPageNo);
//		}
//		Page page = new Page(pageNo);
//		
//		int totalCount = dao.selectBoardCount();
//		PageResult pr = new PageResult(pageNo, totalCount);
//		req.setAttribute("pr", pr);
	}
}










