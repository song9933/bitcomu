package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Onlinecls;

public interface OnlineclsDAO {
	// 전체 과목 리스트 조회 
	List<Onlinecls> selectOnlineclsSubject();
	// 해당과목 전체 온라인강의리스트 조회
	List<Onlinecls> seletOnlinecls(String subject);
	// 해당과목 해당 온라인강의 상세 조회
	Onlinecls selectOneOnlinecls(int ytNo);
	// 온라인강의 등록
	int insertOnlinecls(Onlinecls oncls);
	// 온라인강의 수정
	int updateOnlinecls(Onlinecls oncls);
	// 온라인강의 삭제
	int deleteOnlinecls(int no);
	// 회원 아이디 조회
	String selectUserId(int ytNo);
}
