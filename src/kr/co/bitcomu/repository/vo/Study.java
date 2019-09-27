package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class Study {
	 // 스터디 글 번호 
    private int studyPostNo;

    // 회원 번호 
    private int userNo;

    // 스터디 모집 여부 
    private String studyRecruitEnabled;

    // 스터디 글 제목 
    private String studyPostTitle;

    // 스터디 조회 수 
    private int studyViewCnt;

    // 스터디 지역 
    private String studyLoc;

    // 스터디 모집 인원 
    private int studyRecruitMem;

    // 스터디 모집 분야 
    private String studyRecruitField;

    // 스터디 글 내용 
    private String studyPostContent;

    // 스터디 등록 날짜 
    private Date studyRegDt;

	public int getStudyPostNo() {
		return studyPostNo;
	}

	public void setStudyPostNo(int studyPostNo) {
		this.studyPostNo = studyPostNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getStudyRecruitEnabled() {
		return studyRecruitEnabled;
	}

	public void setStudyRecruitEnabled(String studyRecruitEnabled) {
		this.studyRecruitEnabled = studyRecruitEnabled;
	}

	public String getStudyPostTitle() {
		return studyPostTitle;
	}

	public void setStudyPostTitle(String studyPostTitle) {
		this.studyPostTitle = studyPostTitle;
	}

	public int getStudyViewCnt() {
		return studyViewCnt;
	}

	public void setStudyViewCnt(int studyViewCnt) {
		this.studyViewCnt = studyViewCnt;
	}

	public String getStudyLoc() {
		return studyLoc;
	}

	public void setStudyLoc(String studyLoc) {
		this.studyLoc = studyLoc;
	}

	public int getStudyRecruitMem() {
		return studyRecruitMem;
	}

	public void setStudyRecruitMem(int studyRecruitMem) {
		this.studyRecruitMem = studyRecruitMem;
	}

	public String getStudyRecruitField() {
		return studyRecruitField;
	}

	public void setStudyRecruitField(String studyRecruitField) {
		this.studyRecruitField = studyRecruitField;
	}

	public String getStudyPostContent() {
		return studyPostContent;
	}

	public void setStudyPostContent(String studyPostContent) {
		this.studyPostContent = studyPostContent;
	}

	public Date getStudyRegDt() {
		return studyRegDt;
	}

	public void setStudyRegDt(Date studyRegDt) {
		this.studyRegDt = studyRegDt;
	}
}
