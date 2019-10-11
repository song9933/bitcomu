package kr.co.bitcomu.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.bitcomu.repository.vo.Search;
import kr.co.bitcomu.repository.vo.User;

public interface UserDAO {
	/* 관리자 전용 */
	List<User> selectUserAdmin(Map<String, Object> map);
	void updateUserAdmin(User user);
	void deleteUserAdmin(List<Integer> list);
	void deleteAllUserAdmin();
	int selectUserAdminCount(Search search);
	
	/* 회원 전용 */
	User selectOneUser(User user);
	void insertUser(User user);
	void updateUser(User user);
	void deleteUser(int userNo);
	int selectOneUserCheck(String userId);
	String selectFindUser(User user);
}
