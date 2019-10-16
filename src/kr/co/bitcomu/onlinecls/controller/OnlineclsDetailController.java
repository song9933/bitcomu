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
@WebServlet("/onlineclass/p.do")
public class OnlineclsDetailController extends HttpServlet{
	private OnlineclsDAO dao;
		
	public OnlineclsDetailController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
	}

	public void service(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("application/json; charset=utf-8");
		int ytNo = Integer.parseInt(req.getParameter("no"));
		String subject = req.getParameter("subj");
		int likeCnt = dao.selectLikeCnt(ytNo);
		int[] likeUserNo = dao.selectLike(ytNo);
		
		// 온라인강의 상세 조회 (해당 온라인강의 번호로 온라인강의 객체 가져오기)
		dao.updateViewCnt(ytNo);	// 조회수 1 증가
		Onlinecls ocls = dao.selectOneOnlinecls(ytNo);
		ocls.setYtLike(likeCnt);
		
		req.setAttribute("ocls", ocls);
		// 해당 온라인강의 회원 아이디 조회
		String userId = dao.selectUserId(ytNo); 
//		req.setAttribute("userId", userId); 
		
		// Ajax 처리를 위해 Map에 저장
		Map<String, Object> onclsMap = new HashMap<>();
		onclsMap.put("ocls", ocls);
		onclsMap.put("userId", userId);
		onclsMap.put("likeUserNo", likeUserNo);

		
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(onclsMap));
		out.close();
		
	}
}
