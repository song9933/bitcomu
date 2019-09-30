/**
 * Data 의 처리 클래스
 * 
 * CRUD -> 
 * CREATE  : insert + 기능
 * READ    : select + 기능,  selectOne + 기능
 * UPDATE  : update + 기능
 * DELETE  : delete + 기능
 */
package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Talk;


public interface TalkDAO {
	List<Talk> selectTalk(Page page);
	Talk selectOneTalk(int no);
	void updateViewCnt(int no);
	void insertTalk(Talk talk);
	void updateTalk(Talk talk);
	int deleteTalk(int no);
	int selectTalkCount();
	
	/* 댓글 파트 시작 ========================================= */
	List<Comment> selectComment(int no);
	void insertComment(Comment comment);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
}














