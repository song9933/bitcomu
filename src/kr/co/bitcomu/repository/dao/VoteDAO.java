package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Comment;
import kr.co.bitcomu.repository.vo.Vote;

public interface VoteDAO {
	List<Vote> selectVote();
	List<Vote> selectVoteN(int rnum);
	List<Vote> selectVoteNSmall(int rnum);
	Vote selectOneVote(int voteNo);
	void insertVote(Vote vote);
	void updateVoteInCnt(int voteNo);
	void updateVote(Vote vote);
	void updateVoteCloseEnabled(int voteNo);
	void deleteVote(int voteNo);
	String selectUserId(int voteNo);
	List<Vote> selectVoteSearchAjax(Vote vote);
	List<Vote> selectVoteSearchAjaxSmall(Vote vote);
	
	/*댓글테이블 이용한 투표 변동파트 시작*/
	
	List<Comment> selectVoteIn(int boardPostNo);
	Comment selectOneVoteIn(Comment comment);
	void insertVoteIn(Comment comment);
	void deleteVoteIn(int cmtNo);
	void updateVoteIn(Comment comment);
	int selectCodeValueVote();
	List<Comment> selectCommentInVote(Comment comment);
	void deleteAllVoteIn(int boardPostNo);
}
