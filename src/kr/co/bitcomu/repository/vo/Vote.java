package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Vote {
	private int voteNo;
	private int userNo;
	private Date voteRegDate;
	private String voteTitle;
	private String voteContent;
	private int voteCount;
	private int voteType;
	private String voteMenu;
	private String voteNotice;
	private String voteAnonymous;
	private String voteExpired;
	private String voteExDate;
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
	public Date getVoteRegDate() {
		return voteRegDate;
	}
	public void setVoteRegDate(Date voteRegDate) {
		this.voteRegDate = voteRegDate;
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
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
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
	public String getVoteNotice() {
		return voteNotice;
	}
	public void setVoteNotice(String voteNotice) {
		this.voteNotice = voteNotice;
	}
	public String getVoteAnonymous() {
		return voteAnonymous;
	}
	public void setVoteAnonymous(String voteAnonymous) {
		this.voteAnonymous = voteAnonymous;
	}
	public String getVoteExpired() {
		return voteExpired;
	}
	public void setVoteExpired(String voteExpired) {
		this.voteExpired = voteExpired;
	}
	public String getVoteExDate() {
		return voteExDate;
	}
	public void setVoteExDate(String voteExDate) {
		this.voteExDate = voteExDate;
	}
	
}
