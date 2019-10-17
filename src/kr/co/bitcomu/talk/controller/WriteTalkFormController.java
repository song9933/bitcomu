package kr.co.bitcomu.talk.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.NoticeDAO;
import kr.co.bitcomu.repository.dao.TalkDAO;
import kr.co.bitcomu.repository.vo.Notice;
import kr.co.bitcomu.repository.vo.Talk;
import kr.co.bitcomu.repository.vo.User;



@WebServlet("/talk/write_form.do")
public class WriteTalkFormController extends HttpServlet {
	private TalkDAO dao;
	public WriteTalkFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TalkDAO.class);
	}
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		RequestDispatcher dis = req.getRequestDispatcher("/jsp/talk/talk_write.jsp");
		dis.forward(req, res);
	}
}














