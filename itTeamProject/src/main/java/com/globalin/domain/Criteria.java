package com.globalin.domain;

// 페이지 처리 정보 저장
public class Criteria {

	// present page number
	private int pageNum;
	private int amount;
	
	private String searchType;
	private String keyword;
	
	
	public Criteria() {
		// 첫 페이지 번호 1, 한 페이지 당 10개 씩으로 초기화
		this.pageNum = 1;
		this.amount = 10;
		
	}

	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
	
	
	public String[] getSearchTypeArr() {
		// searchType 변수의 문자열을 쪼개서 문자열 배열로 리턴		
		return searchType == null ? 
				new String[] {} : searchType.split("");
		
	}
	
}