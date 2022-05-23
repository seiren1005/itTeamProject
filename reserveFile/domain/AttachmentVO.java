package com.globalin.domain;

import java.sql.Date;

public class AttachmentVO {

	private String fileName;
	private String savePath;
	private String uuid;
	private int bno;
	private Date regDate;
	
	// check whether they are image files or not
	private String imgCheck;

	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getImgCheck() {
		return imgCheck;
	}
	public void setImgCheck(String imgCheck) {
		this.imgCheck = imgCheck;
	}
	
	
	@Override
	public String toString() {
		return "AttachmentVO [fileName=" + fileName + ", savePath=" + savePath + ", uuid=" + uuid + ", bno=" + bno
				+ ", regDate=" + regDate + ", imgCheck=" + imgCheck + "]";
	}
		
	
}
