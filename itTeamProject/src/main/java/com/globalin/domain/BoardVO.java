package com.globalin.domain;

import java.util.Arrays;
import java.util.Date;

// 게시판 글 정보 저장
public class BoardVO {

	private int bno, replyCnt, viewCnt;
	private String purpose, title, content, writer;
	
	// 비밀글 컬럼
	private String secret = "no";
	
	private Date regDate, modDate;
	
	// 파일 업로드 관련
//	private String[] files;
	private String fileInfo;
	
	
	public String getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
//	public String[] getFiles() {
//		return files;
//	}
//	public void setFiles(String[] files) {
//		this.files = files;
//	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
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
		return "BoardVO [bno=" + bno + ", replyCnt=" + replyCnt + ", viewCnt=" + viewCnt + ", purpose=" + purpose
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + ", secret=" + secret
				+ ", regDate=" + regDate + ", modDate=" + modDate + ", fileInfo=" + fileInfo + "]";
	}
		
	
}
