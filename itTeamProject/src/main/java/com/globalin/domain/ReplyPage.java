package com.globalin.domain;

import java.util.List;

// 댓글 페이지 처리 정보 저장
public class ReplyPage {

	// number of replies
	private int replyCnt;
	// collection of replies
	private List<ReplyVO> replyList;
	
	private int checkValue;
	
	
	
	public int getCheckValue() {
		return checkValue;
	}
	public void setCheckValue(int checkValue) {
		this.checkValue = checkValue;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	
	@Override
	public String toString() {
		return "ReplyPage [replyCnt=" + replyCnt + ", replyList=" + replyList + ", checkValue=" + checkValue + "]";
	}
	
	
}
