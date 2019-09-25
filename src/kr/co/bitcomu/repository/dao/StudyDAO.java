package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Study;

public interface StudyDAO {
	List<Study> selectStudy();
	Study selectOneStudy(int postNo);
	void insertStudy(Study study);
	
}
