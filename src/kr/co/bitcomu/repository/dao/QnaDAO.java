package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Qna;

public interface QnaDAO {
	
	List<Qna> selectQnaList();
	Qna selectOneQna(int qnaNo);
	void insertQna(Qna qna);
	void updateQna(Qna qna);
	void deleteQna(int qnaNo);
}
