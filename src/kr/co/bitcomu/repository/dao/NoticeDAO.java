package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Notice;
import kr.co.bitcomu.repository.vo.Page;


public interface NoticeDAO {
	
	List<Notice> selectNotice(Page page);
	Notice selectOneNotice(int no);
	void updateViewCnt(int no);
	void insertNotice(Notice notice);
	void updateNotice(Notice notice);
	int deleteNotice(int no);
	int selectNoticeCount();

}
