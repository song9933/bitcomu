package kr.co.bitcomu.repository.vo;

public class VoteIn {
	private int voteInNo;
	private int voteNo;
	private int userNo;
	private String voteData;
	public int getVoteInNo() {
		return voteInNo;
	}
	public void setVoteInNo(int voteInNo) {
		this.voteInNo = voteInNo;
	}
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
	public String getVoteData() {
		return voteData;
	}
	public void setVoteData(String voteData) {
		this.voteData = voteData;
	}
	
}
