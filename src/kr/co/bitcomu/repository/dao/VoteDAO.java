package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Vote;
import kr.co.bitcomu.repository.vo.VoteIn;

public interface VoteDAO {
	List<Vote> selectVote();
	Vote selectOneVote(int voteNo);
	void insertVote(Vote vote);
	void updateVoteCount(int voteNo);
	void updateVote(Vote vote);
	void deleteVote(int voteNo);
	
	/*투표 변동파트 시작*/
	
	List<VoteIn> selectVoteIn(int voteNo);
	VoteIn selectOneVoteIn(int voteInNo);
	void insertVoteIn(VoteIn voteIn);
	void deleteVoteIn(int voteInNo);
}
