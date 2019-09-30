package kr.co.bitcomu.repository.vo;

public class Search {
	private String searchType;//이름, 제목, 내용... or id, name, addr ..
	private String searchWord;//검색어 ex 홍길동
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}