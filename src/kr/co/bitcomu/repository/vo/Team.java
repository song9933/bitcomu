package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Team {
	private int userNo;
	private int teamNo;
	private int projectNo;
	private int teamBoardNo;
	private String userId;
	private String teamBoardTitle;
	private String teamBoardContent;
	private Date teamBoardRegDt;
	
	public int getTeamBoardNo() {
		return teamBoardNo;
	}
	public Team setTeamBoardNo(int teamBoardNo) {
		this.teamBoardNo = teamBoardNo;
		return this;
	}
	public String getUserId() {
		return userId;
	}
	public Team setUserId(String userId) {
		this.userId = userId;
		return this;
	}
	public int getUserNo() {
		return userNo;
	}
	public Team setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public Team setTeamNo(int teamNo) {
		this.teamNo = teamNo;
		return this;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public Team setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	public String getTeamBoardTitle() {
		return teamBoardTitle;
	}
	public Team setTeamBoardTitle(String teamBoardTitle) {
		this.teamBoardTitle = teamBoardTitle;
		return this;
	}
	public String getTeamBoardContent() {
		return teamBoardContent;
	}
	public Team setTeamBoardContent(String teamBoardContent) {
		this.teamBoardContent = teamBoardContent;
		return this;
	}
	public Date getTeamBoardRegDt() {
		return teamBoardRegDt;
	}
	public Team setTeamBoardRegDt(Date teamBoardRegDt) {
		this.teamBoardRegDt = teamBoardRegDt;
		return this;
	}
	
	
	
}
