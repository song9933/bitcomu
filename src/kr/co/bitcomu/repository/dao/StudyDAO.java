package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Study;

public interface StudyDAO {
	List<Study> selectStudyList();
	Study selectOneStudy(int studyPostNo);
	void insertStudy(Study study);
	void updateStudy(Study study);
	void deleteStudy(int studyPostNo);
}
