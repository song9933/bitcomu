package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Vote {
	private int voteNo;
	private int userNo;
	private Date voteRegDt;
	private String voteTitle;
	private String voteContent;
	private int voteInCnt;
	private int voteType;
	private String voteMenu;
	private String voteNoticeEnabled;
	private String voteAnonyEnabled;
	private String voteCloseEnabled;
	private String voteCloseDt;
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getVoteRegDt() {
		return voteRegDt;
	}
	public void setVoteRegDt(Date voteRegDt) {
		this.voteRegDt = voteRegDt;
	}
	public String getVoteTitle() {
		return voteTitle;
	}
	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}
	public String getVoteContent() {
		return voteContent;
	}
	public void setVoteContent(String voteContent) {
		this.voteContent = voteContent;
	}
	public int getVoteInCnt() {
		return voteInCnt;
	}
	public void setVoteInCnt(int voteInCnt) {
		this.voteInCnt = voteInCnt;
	}
	public int getVoteType() {
		return voteType;
	}
	public void setVoteType(int voteType) {
		this.voteType = voteType;
	}
	public String getVoteMenu() {
		return voteMenu;
	}
	public void setVoteMenu(String voteMenu) {
		this.voteMenu = voteMenu;
	}
	public String getVoteNoticeEnabled() {
		return voteNoticeEnabled;
	}
	public void setVoteNoticeEnabled(String voteNoticeEnabled) {
		this.voteNoticeEnabled = voteNoticeEnabled;
	}
	public String getVoteAnonyEnabled() {
		return voteAnonyEnabled;
	}
	public void setVoteAnonyEnabled(String voteAnonyEnabled) {
		this.voteAnonyEnabled = voteAnonyEnabled;
	}
	public String getVoteCloseEnabled() {
		return voteCloseEnabled;
	}
	public void setVoteCloseEnabled(String voteCloseEnabled) {
		this.voteCloseEnabled = voteCloseEnabled;
	}
	public String getVoteCloseDt() {
		return voteCloseDt;
	}
	public void setVoteCloseDt(String voteCloseDt) {
		this.voteCloseDt = voteCloseDt;
	}
	
}
