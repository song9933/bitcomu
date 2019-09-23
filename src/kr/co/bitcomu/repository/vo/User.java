package kr.co.bitcomu.repository.vo;

import java.util.Date;

public class User {
	private int userNo;
	private String userId;
	private String userName;
	private String userPass;
	private String userMobile;
	private String userEmail;
	private Date userBirth;
	private int userGrade;
	public User() {	}
	public User(int userNo, String userId, String userName, String userPass, String userMobile, String userEmail,
			Date userBirth, int userGrade) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userMobile = userMobile;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.userGrade = userGrade;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userPass=" + userPass
				+ ", userMobile=" + userMobile + ", userEmail=" + userEmail + ", userBirth=" + userBirth
				+ ", userGrade=" + userGrade + "]";
	}
	
}
