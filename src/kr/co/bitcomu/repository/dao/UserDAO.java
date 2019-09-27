package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.User;

public interface UserDAO {
	/* 관리자 전용 */
	List<User> selectUserAdmin(Page page);
	void updateUserAdmin(User user);
	void deleteUserAdmin(List<Integer> list);
	void deleteAllUserAdmin();
	int selectUserAdminCount();
	
	/* 회원 전용 */
	User selectOneUser(User user);
	void insertUser(User user);
	void updateUser(User user);
	void deleteUser(int userNo);
	int selectOneUserCheck(int userNo);
	List<String> selectMolibeList();
	String selectFindUser(User user);
}
