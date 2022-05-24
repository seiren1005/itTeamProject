package com.globalin.bulletindomain;

import java.util.List;

// 댓글 페이지 처리 정보 저장
public class BulletinReplyPage {

	// number of replies
	private int replyCnt;
	// collection of replies
	private List<BulletinReplyVO> replyList;
	
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
	public List<BulletinReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<BulletinReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	
	@Override
	public String toString() {
		return "ReplyPage [replyCnt=" + replyCnt + ", replyList=" + replyList + ", checkValue=" + checkValue + "]";
	}
	
	
}
