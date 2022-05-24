package com.globalin.bulletindomain;

import java.util.Date;

// 댓글 정보 저장
public class BulletinReplyVO {
	
	
	private int rno, bno;
	private String reply, replyer;
	private String adoption;
	private Date replyRegDate;
	private Date replyModDate;
	
	
	
	public String getAdoption() {
		return adoption;
	}
	public void setAdoption(String adoption) {
		this.adoption = adoption;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public Date getReplyModDate() {
		return replyModDate;
	}
	public void setReplyModDate(Date replyModDate) {
		this.replyModDate = replyModDate;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", reply=" + reply + ", replyer=" + replyer + ", adoption="
				+ adoption + ", replyRegDate=" + replyRegDate + ", replyModDate=" + replyModDate + "]";
	}
		
	
}
