package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Study {
	// 스터디게시판 테이블
	// 글 번호
	private int postNo;

	// 회원 번호
	private int userNo;

	// 모집 여부
	private String recruitEnabled;

	// 글 제목
	private String postTitle;

	// 조회 수
	private int viewCnt;

	// 등록 날짜
	private Date regDt;

	// 지역
	private String loc;

	// 모집 인원
	private int recruitMem;

	// 모집 분야
	private String recruitField;

	// 글 내용
	private String postContent;

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getRecruitEnabled() {
		return recruitEnabled;
	}

	public void setRecruitEnabled(String recruitEnabled) {
		this.recruitEnabled = recruitEnabled;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public int getRecruitMem() {
		return recruitMem;
	}

	public void setRecruitMem(int recruitMem) {
		this.recruitMem = recruitMem;
	}

	public String getRecruitField() {
		return recruitField;
	}

	public void setRecruitField(String recruitField) {
		this.recruitField = recruitField;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	
	
}
