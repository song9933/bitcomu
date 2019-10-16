package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Qna;
import kr.co.bitcomu.repository.vo.Study;
import kr.co.bitcomu.repository.vo.Vote;

public interface QnaDAO {
	
	List<Qna> selectQna(Page page);
	Qna selectOneQna(int qnaNo);
	void updateQnaViewCnt(int qnaNo);
	void insertQna(Qna qna);
	void updateQna(Qna qna);
	void deleteQna(int qnaNo);
	int selectQnaCnt();
	List<Qna> selectQnaN(int rnum);
	List<Qna> selectQnaNSmall(int rnum);
	String selectUserId(int qnaNo);
	List<Qna> selectQnaSearchAjax(Qna qna);
	List<Qna> selectQnaSearchAjaxSmall(Qna qna);
	int updateViewCntQna(int qnaNo);
	int selectViewCntQna(int qnaNo);
	void insertLike(Qna qna);
	int selectLike(int qnaNo);
	
	// 댓글 부분
	List<Comment> selectQnaCommentList(int boardPostNo);
	void insertQnaComment(Comment comment);
	void updateQnaComment(Comment comment);
	void deleteQnaComment(int cmtNo);
	
	int qnaCmtCnt(int qnaNo);

}
