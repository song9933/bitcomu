package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Study;

public interface StudyDAO {
	List<Study> selectStudyList(Page page);
	Study selectOneStudy(int studyPostNo);
	void insertStudy(Study study);
	void updateStudy(Study study);
	void deleteStudy(int studyPostNo);
	
	void insertComment(Comment comment);
	List<Comment> selectCommentList(int studyPostNo);
	void updateComment(Comment comment);
	void deleteComment(int cmtNo);
	
	void updateViewCnt(int studyPostNo);
	
	int studyCmtCnt(int studyPostNo);
}
