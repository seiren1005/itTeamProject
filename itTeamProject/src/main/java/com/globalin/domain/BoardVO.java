package com.globalin.domain;

import java.util.Date;

// 게시판 글 정보 저장
public class BoardVO {

	private int bno, replyCnt;
	private String title, content, writer;
	private Date regDate, modDate;
	
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", replyCnt=" + replyCnt + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}
		
	
}
