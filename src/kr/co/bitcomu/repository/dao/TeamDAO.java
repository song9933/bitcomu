package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Team;
import kr.co.bitcomu.repository.vo.TeamComment;

public interface TeamDAO {
	List<Team> selectTeamBoard();
	Team selectOneTeamBoard(int no);
	void insertTeamBoard(Team team);
	void updateTeamBoard(Team team);
	int deleteTeamBoard(int no);
	
	/* 댓글 파트 시작 ========================================= */
	List<Team> selectComment(int teamBoardCmtNo);
	void insertComment(TeamComment teamComment);
	void deleteComment(int commentNo);
	void updateComment(TeamComment teamComment);
}
