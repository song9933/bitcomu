package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Board {
	private int userNo;
	private String userId;
	private String postTitle;
	private Date regDt;
	private String codeName;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int userNo, String userId, String postTitle, Date regDt, String codeName) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.postTitle = postTitle;
		this.regDt = regDt;
		this.codeName = codeName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	@Override
	public String toString() {
		return "Board [userNo=" + userNo + ", userId=" + userId + ", postTitle=" + postTitle + ", regDt=" + regDt
				+ ", codeName=" + codeName + "]";
	}
	

		
	
}
