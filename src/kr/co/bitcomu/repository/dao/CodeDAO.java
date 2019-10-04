package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Code;

public interface CodeDAO {
	List<Code> selectCode(String codeGroup);
}
