package kr.co.bitcomu.team.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.fileupload.BitcomuFileRenamePolicy;
import kr.co.bitcomu.repository.dao.TeamDAO;
import kr.co.bitcomu.repository.vo.Team;
import kr.co.bitcomu.repository.vo.User;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/team/teamBoardWrite.do")
public class WriteTeamBoardController extends HttpServlet {
	
	private TeamDAO dao;

	public WriteTeamBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(TeamDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/json; charset=utf-8");		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		dao.insertTeamBoard(
				new Team().setUserNo(user.getUserNo())
						.setTeamNo(Integer.parseInt(req.getParameter("teamNo")))
						.setProjectNo(Integer.parseInt(req.getParameter("projectNo")))
						.setTeamBoardTitle(req.getParameter("teamBoardTitle"))
						.setTeamBoardContent(req.getParameter("teamBoardContent").replace("\r\n", "<br>")));
		
		res.sendRedirect("teamBoardList.do");

	}
	
}
