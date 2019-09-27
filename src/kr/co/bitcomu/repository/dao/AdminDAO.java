package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Board;
import kr.co.bitcomu.repository.vo.Page;

public interface AdminDAO {
	List<Board> selectAllBoards(Page page);
	int selectAllBoardsCount();
}
