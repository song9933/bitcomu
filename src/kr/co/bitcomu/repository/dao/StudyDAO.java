package kr.co.bitcomu.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Study;

public interface StudyDAO {
	List<Study> selectStudyList(Map<String, Object> map);
	Study selectOneStudy(int studyPostNo);
	void insertStudy(Study study);
	void updateStudy(Study study);
	void deleteStudy(int studyPostNo);
	
	void insertComment(Comment comment);
	void insertReComment(Comment comment);
	List<Comment> selectCommentList(int studyPostNo);
	void updateComment(Comment comment);
	void deleteComment(int cmtNo);
	
	void updateViewCnt(int studyPostNo);
	
	int studyCmtCnt(int studyPostNo);
	
	Study mainStudyPost();
}
