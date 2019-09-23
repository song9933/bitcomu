package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.User;

public interface UserDAO {
	/* 관리자 전용 */
	List<User> selectUserAdmin();
	void updateUserAdmin(int userNo);
	void deleteUserAdmin(List<Integer> list);
	void deleteAllUserAdmin();
	
	/* 회원 전용 */
	User selectOneUser(User user);
	void insertUser(User user);
	void updateUser(User user);
	void deleteUser(int userNo);
	int selectOneUserCheck(int userNo);
	List<String> selectMolibeList();
	String selectFindUser(User user);
}
