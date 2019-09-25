package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class TeamComment {
	private int userNo;
	private int teamBoardNo;
	private String teamBoardCmt;
	private Date teamBoardCmtDate;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTeamBoardNo() {
		return teamBoardNo;
	}
	public void setTeamBoardNo(int teamBoardNo) {
		this.teamBoardNo = teamBoardNo;
	}
	public String getTeamBoardCmt() {
		return teamBoardCmt;
	}
	public void setTeamBoardCmt(String teamBoardCmt) {
		this.teamBoardCmt = teamBoardCmt;
	}
	public Date getTeamBoardCmtDate() {
		return teamBoardCmtDate;
	}
	public void setTeamBoardCmtDate(Date teamBoardCmtDate) {
		this.teamBoardCmtDate = teamBoardCmtDate;
	}
	
	
	
}
