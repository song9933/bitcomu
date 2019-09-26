package kr.co.bitcomu.onlinecls.controller;

import kr.co.bitcomu.common.db.MyAppSqlConfig;
import kr.co.bitcomu.repository.dao.OnlineclsDAO;
import kr.co.bitcomu.repository.vo.Onlinecls;

public class OnlineclsWriteController {
	private static OnlineclsDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(OnlineclsDAO.class);
/*	
	public static void main(String[] args) {
		Onlinecls oncls1 = new Onlinecls();
		oncls1.setUserNo(2);
		oncls1.setYtTitle("제목2");
		oncls1.setYtContent("내용2");
		oncls1.setYtAddr("https://www.youtube.com/watch?v=wjLwmWyItWI&list=PLRx0vPvlEmdBjfCADjCc41aD4G0bmdl4R");
		oncls1.setYtSubject("sql");
		dao.insertOnlinecls(oncls1);
		System.out.println("등록 OK");
		// ------------------------------------
		Onlinecls oncls2 = new Onlinecls();
		oncls2.setUserNo(2);
		oncls2.setYtTitle("제목2");
		oncls2.setYtContent("내용2");
		oncls2.setYtAddr("https://www.youtube.com/watch?v=tXubUpSb2p8");
		oncls2.setYtSubject("sql");
		dao.insertOnlinecls(oncls2);
		System.out.println("2_등록 OK");
		// ------------------------------------
		Onlinecls oncls3 = new Onlinecls();
		oncls3.setUserNo(2);
		oncls3.setYtTitle("제목3");
		oncls3.setYtContent("내용3");
		oncls3.setYtAddr("https://www.youtube.com/watch?v=pn3J8bbP42I");
		oncls3.setYtSubject("스프링");
		dao.insertOnlinecls(oncls3);
		System.out.println("3_등록 OK");
		// ------------------------------------
		Onlinecls oncls4 = new Onlinecls();
		oncls4.setUserNo(2);
		oncls4.setYtTitle("제목4");
		oncls4.setYtContent("내용4");
		oncls4.setYtAddr("https://www.youtube.com/watch?v=XbeEc_uRCsY");
		oncls4.setYtSubject("sql");
		dao.insertOnlinecls(oncls4);
		System.out.println("4_등록 OK");
		// ------------------------------------
		Onlinecls oncls5 = new Onlinecls();
		oncls5.setUserNo(2);
		oncls5.setYtTitle("제목5");
		oncls5.setYtContent("내용5");
		oncls5.setYtAddr("https://www.youtube.com/watch?v=wjLwmWyItWI&list=PLRx0vPvlEmdBjfCADjCc41aD4G0bmdl4R");
		oncls5.setYtSubject("Ajax");
		dao.insertOnlinecls(oncls5);
		System.out.println("5_등록 OK");
		// ------------------------------------
		Onlinecls oncls6 = new Onlinecls();
		oncls6.setUserNo(2);
		oncls6.setYtTitle("제목6");
		oncls6.setYtContent("내용6");
		oncls6.setYtAddr("https://www.youtube.com/watch?v=U_ICTI-1DBc");
		oncls6.setYtSubject("JSP");
		dao.insertOnlinecls(oncls6);
		System.out.println("6_등록 OK");
		// ------------------------------------
		Onlinecls oncls7 = new Onlinecls();
		oncls7.setUserNo(2);
		oncls7.setYtTitle("제목7");
		oncls7.setYtContent("내용7");
		oncls7.setYtAddr("https://www.youtube.com/watch?v=Q-TzxXw2jQY");
		oncls7.setYtSubject("Ajax");
		dao.insertOnlinecls(oncls7);
		System.out.println("7_등록 OK");
		// ------------------------------------
		Onlinecls oncls8 = new Onlinecls();
		oncls8.setUserNo(2);
		oncls8.setYtTitle("제목8");
		oncls8.setYtContent("내용8");
		oncls8.setYtAddr("https://www.youtube.com/watch?v=MtxFWczSFqU");
		oncls8.setYtSubject("자바스크립트");
		dao.insertOnlinecls(oncls8);
		System.out.println("8_등록 OK");
		// ------------------------------------
		Onlinecls oncls9 = new Onlinecls();
		oncls9.setUserNo(2);
		oncls9.setYtTitle("제목9");
		oncls9.setYtContent("내용9");
		oncls9.setYtAddr("https://www.youtube.com/watch?v=RYo3OGlRoJw&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=4");
		oncls9.setYtSubject("JSP");
		dao.insertOnlinecls(oncls9);
		System.out.println("9-등록 OK");
	}
*/
}
