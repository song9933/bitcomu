package kr.co.bitcomu.repository.dao;

import java.util.List;
import java.util.Map;

import kr.co.bitcomu.repository.vo.Board;
import kr.co.bitcomu.repository.vo.Page;
import kr.co.bitcomu.repository.vo.Search;

public interface AdminDAO {
	List<Board> selectAllBoards(Map<String, Object> map);
	int selectAllBoardsCount(Search search);
	List<Board> selectOneBoard(Map<String, Object> map);
	int selectOneBoardCount(Map<String, Object> map);
	
}
