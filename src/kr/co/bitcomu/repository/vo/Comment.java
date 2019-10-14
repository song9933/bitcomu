package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Comment {
	private int cmtNo;
	private int userNo;
	private int boardPostNo;
	private String cmtContent;
	private String cmtRegDt;
	private int codeValue;
	private String userId;
	private int parentCmtNo;
	private int cmtGroupNo;
	
	
	public void setCmtRegDt(String cmtRegDt) {
		this.cmtRegDt = cmtRegDt;
	}
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBoardPostNo() {
		return boardPostNo;
	}
	public void setBoardPostNo(int boardPostNo) {
		this.boardPostNo = boardPostNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public int getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(int codeValue) {
		this.codeValue = codeValue;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Comment [cmtNo=" + cmtNo + ", userNo=" + userNo + ", boardPostNo=" + boardPostNo + ", cmtContent="
				+ cmtContent + ", cmtRegDt=" + cmtRegDt + ", codeValue=" + codeValue + ", userId=" + userId + "]";
	}
	public int getParentCmtNo() {
		return parentCmtNo;
	}
	public void setParentCmtNo(int parentCmtNo) {
		this.parentCmtNo = parentCmtNo;
	}
	public int getCmtGroupNo() {
		return cmtGroupNo;
	}
	public void setCmtGroupNo(int cmtGroupNo) {
		this.cmtGroupNo = cmtGroupNo;
	}
	public String getCmtRegDt() {
		return cmtRegDt;
	}
	
	
	
	
	
	
	
	
}
