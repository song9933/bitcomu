package kr.co.bitcomu.repository.vo;

import java.util.Date;
import java.util.List;

public class Qna {
	
	private int qnaNo;  // qna 글 번호
	private int userNo; // 유저 번호
	private String userId; // 유저 id
	private String qnaTitle; // qna 제목
	private String qnaContent; // qna 내용
	private String qnaPublicEnabled; // qna 공개 여부
	private int qnaLikeCnt; // qna 좋아요 수
	private Date qnaRegDt; // qna 등록 날짜
	private int qnaViewCnt; // qna 조회 수
	private int qnaCmtCnt; // qna 댓글 수
	private List<Comment> commentList;
	private String qnakeyword;
	
	
	
	public String getQnakeyword() {
		return qnakeyword;
	}
	public void setQnakeyword(String qnakeyword) {
		this.qnakeyword = qnakeyword;
	}
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getQnaViewCnt() {
		return qnaViewCnt;
	}
	public void setQnaViewCnt(int qnaViewCnt) {
		this.qnaViewCnt = qnaViewCnt;
	}
	public int getQnaCmtCnt() {
		return qnaCmtCnt;
	}
	public void setQnaCmtCnt(int qnaCmtCnt) {
		this.qnaCmtCnt = qnaCmtCnt;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}
