package kr.co.bitcomu.repository.vo;

public class Team {
	private int userNo;
	private int teamNo;
	private int projectNo;
	private int teamBoardNo;
	private int cmtCount;
	private String userName;
	private String userId;
	private String teamBoardTitle;
	private String teamBoardContent;
	private String teamBoardRegDt;
	
	public int getCmtCount() {
		return cmtCount;
	}
	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	public String getUserName() {
		return userName;
	}
	public Team setUserName(String userName) {
		this.userName = userName;
		return this;
	}
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
	public String getTeamBoardRegDt() {
		return teamBoardRegDt;
	}
	public void setTeamBoardRegDt(String teamBoardRegDt) {
		this.teamBoardRegDt = teamBoardRegDt;
	}
	
	
}
