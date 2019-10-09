package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Qna;

public interface QnaDAO {
	
	List<Qna> selectQna(Page page);
	Qna selectOneQna(int no);
	void insertQna(Qna qna);
	void updateQna(Qna qna);
	void deleteQna(int no);
	int selectQnaCount();
	
	
	// 댓글 부분
	void insertComment(Comment comment);
	List<Comment> selectCommentList(int qnaNo);
	void updateComment(Comment comment);
	void deleteComment(int cmtNo);
	
	void updateViewCnt(int qnaNo);
	
	int studyCmtCnt(int qnaNo);

}
