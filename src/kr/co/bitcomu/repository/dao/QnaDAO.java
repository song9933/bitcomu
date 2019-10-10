package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.repository.vo.Study;

public interface QnaDAO {
	
	List<Qna> selectQna(Page page);
	Qna selectOneQna(int qnano);
	void updateQnaViewCnt(int qnano);
	void insertQna(Qna qna);
	void updateQna(Qna qna);
	void deleteQna(int qnano);
	int selectQnaCnt();
	
	
	// 댓글 부분
	List<Comment> selectCommentList(int qnaNo);
	void insertComment(Comment comment);
	void updateComment(Comment comment);
	void deleteComment(int cmtNo);
	
	int qnaCmtCnt(int qnaNo);

}
