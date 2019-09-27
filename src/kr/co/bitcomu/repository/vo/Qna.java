package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Qna {
	
	private int qnaNo;  // qna 글 번호
	private int userNo; // 유저 번호
	private String qnaTitle; // qna 제목
	private String qnaContent; // qna 내용
	private String qnaPublicEnabled; // qna 공개 여부
	private int qnaLikeCnt; // qna 좋아요 수
	private Date qnaRegDt; // qna 등록 날짜
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaPublicEnabled() {
		return qnaPublicEnabled;
	}
	public void setQnaPublicEnabled(String qnaPublicEnabled) {
		this.qnaPublicEnabled = qnaPublicEnabled;
	}
	public int getQnaLikeCnt() {
		return qnaLikeCnt;
	}
	public void setQnaLikeCnt(int qnaLikeCnt) {
		this.qnaLikeCnt = qnaLikeCnt;
	}
	public Date getQnaRegDt() {
		return qnaRegDt;
	}
	public void setQnaRegDt(Date qnaRegDt) {
		this.qnaRegDt = qnaRegDt;
	}
	
	
	
	
}
