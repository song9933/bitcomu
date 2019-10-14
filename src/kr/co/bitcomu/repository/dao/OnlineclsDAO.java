package kr.co.bitcomu.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Onlinecls;
import kr.co.bitcomu.repository.vo.Search;

public interface OnlineclsDAO {
	// 전체 과목 리스트 조회 
	List<Onlinecls> selectOnlineclsSubject();
	// 해당과목 전체 온라인강의리스트 조회
	List<Onlinecls> seletOnlinecls(String subject);
	// 검색한 결과로 카운트 조회
	int selectOnlineclsCount(Map map);
	// 온라인강의 리스트 (검색 & 페이징 포함) 조회
	List<Onlinecls> selectOnlineclsList(Map<String, Object> map);
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
	
	/* 댓글파트 */
	// 댓글 작성자 아이디 조회
	List<String> selectCmtUserId(int ytNo);
	// 전체 댓글 리스트 조회 (code_value, board_post_no로 select)
	List<Comment> selectComment(int ytNo);
	// 댓글 등록
	int insertComment(Comment comment);
	// 댓글 수정
	int updateComment(Comment comment);
	// 댓글 삭제
	int deleteComment(int cmtNo);
}
