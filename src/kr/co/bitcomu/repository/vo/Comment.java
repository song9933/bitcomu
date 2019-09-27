package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Comment {
	private int cmtNo;
	private int userNo;
	private int boardPostNo;
	private Date cmtRegDt;
	private int codeValue;
	
	int getCmtNo() {
		return cmtNo;
	}
	void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	int getUserNo() {
		return userNo;
	}
	void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	int getBoardPostNo() {
		return boardPostNo;
	}
	void setBoardPostNo(int boardPostNo) {
		this.boardPostNo = boardPostNo;
	}
	Date getCmtRegDt() {
		return cmtRegDt;
	}
	void setCmtRegDt(Date cmtRegDt) {
		this.cmtRegDt = cmtRegDt;
	}
	int getCodeValue() {
		return codeValue;
	}
	void setCodeValue(int codeValue) {
		this.codeValue = codeValue;
	}
	
	
	
}
