package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Qna;

public interface QnaDAO {
	
	List<Qna> selectQna(Page page);
	Qna selectOneQna(int no);
	void insertQna(Qna qna);
	void updateQna(Qna qna);
	void deleteQna(int no);
	int selectQnaCount();

}
