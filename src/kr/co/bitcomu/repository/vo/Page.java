package kr.co.bitcomu.repository.vo;

import kr.co.bitcomu.repository.vo.Page;

public class Page {
	private int pageNo;
	private int listSize;
	
	public Page() {
		this(1, 10);
	}
	public Page(int pageNo) { 
		this(pageNo, 10);
	}
	public Page(int pageNo, int listSize) { 
		this.pageNo = pageNo; 
		this.listSize = listSize; 
	}

	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	// #{begin}
	public int getBegin() {
		return (pageNo - 1) * listSize + 1;
	}
	// #{end}
	public int getEnd() {
		return pageNo * listSize;
	}
	
	public static void main(String[] args) {
		int listSize = 5;
		for (int pageNo = 1; pageNo < 11; pageNo++) {
			Page p1 = new Page(pageNo, listSize);
		}
	}
}









