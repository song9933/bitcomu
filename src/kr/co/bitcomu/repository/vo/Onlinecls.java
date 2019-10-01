package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Onlinecls {
	
	// 온라인강의 번호 
	private int ytNo;
	// 회원 번호 온라인강의 작성자
	private int userNo;
	// 온라인강의 제목 
	private String ytTitle;
	// 온라인강의 내용 
	private String ytContent;
	// 온라인강의 주소 
	private String ytAddr;	
	// 온라인강의 과목	
	private Date ytRegDt;
	// 온라인강의 조회 수 	
	private String ytSubject;
	// 온라인강의 등록 날짜 
	private int ytViewCnt;
	// 온라인강의 좋아요 수 	
	private int ytLike;
	// 회원 아이디
	private String userId;
	
	// getter와 setter
	public int getYtNo() {
		return ytNo;
	}
	public void setYtNo(int ytNo) {
		this.ytNo = ytNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getYtTitle() {
		return ytTitle;
	}
	public void setYtTitle(String ytTitle) {
		this.ytTitle = ytTitle;
	}
	public String getYtContent() {
		return ytContent;
	}
	public void setYtContent(String ytContent) {
		this.ytContent = ytContent;
	}
	public String getYtAddr() {
		return ytAddr;
	}
	public void setYtAddr(String ytAddr) {
		this.ytAddr = ytAddr;
	}
	public Date getYtRegDt() {
		return ytRegDt;
	}
	public void setYtRegDt(Date ytRegDt) {
		this.ytRegDt = ytRegDt;
	}
	public String getYtSubject() {
		return ytSubject;
	}
	public void setYtSubject(String ytSubject) {
		this.ytSubject = ytSubject;
	}
	public int getYtViewCnt() {
		return ytViewCnt;
	}
	public void setYtViewCnt(int ytViewCnt) {
		this.ytViewCnt = ytViewCnt;
	}
	public int getYtLike() {
		return ytLike;
	}
	public void setYtLike(int ytLike) {
		this.ytLike = ytLike;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
