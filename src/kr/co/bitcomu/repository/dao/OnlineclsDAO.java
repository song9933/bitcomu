package kr.co.bitcomu.repository.dao;

import java.util.List;

import kr.co.bitcomu.repository.vo.Onlinecls;

public interface OnlineclsDAO {
	List<Onlinecls> seletOnlinecls();
	Onlinecls selectOneOnlinecls(Onlinecls oncls);
	void insertOnlinecls(Onlinecls oncls);
}
