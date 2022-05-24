package com.globalin.bulletindomain;

// 게시판 페이지 처리 정보 저장
public class BulletinBoardPage {
	
	private int startPage, endPage;	
	// weather a previous or next page is exist 
	private boolean prev, next;
	
	// total amount of board
	private int total;
	
	// criteria of page
	private BulletinCriteria cri;
	
	
	public BulletinBoardPage(BulletinCriteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		// endPage
		this.endPage = 
				(int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		
		// startPage
		this.startPage = endPage - 9;
		
		// real endPage
		// 전체 게시글의 수가 100 개 미만일 경우 실제 페이지 번호는
		// 10 보다 작기 때문에 이에 관련된 처리가 필요
		int realEndPage = 
				(int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEndPage < this.endPage) {
			
			this.endPage = realEndPage;
			
		}
		
		// previous page
		this.prev = this.startPage > 1;
		// startPage 가 1 보다 크면 전 페이지가 존재하므로 true
		
		// next page
		this.next = this.endPage < realEndPage;
		// endPage 보다 realEndPage 가 더 크다는 것은 현재 보여지는
		// 페이지 넘버의 수보다 많은 게시글이 존재. 즉, 다음
		// 페이지가 존재하므로 true
				
	}
	
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public BulletinCriteria getCri() {
		return cri;
	}
	public void setCri(BulletinCriteria cri) {
		this.cri = cri;
	}


	@Override
	public String toString() {
		return "BoardPage [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
		
}
