package com.globalin.bulletindomain;

import java.sql.Date;

// 게시판 파일 업로드 정보 저장
public class BulletinFileVO {

	private int bno;
	private String fileName, uploadPath, uuid;
	private boolean imageCheck;
	private Date regDate;
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImageCheck() {
		return imageCheck;
	}
	public void setImageCheck(boolean imageCheck) {
		this.imageCheck = imageCheck;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [bno=" + bno + ", fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid
				+ ", imageCheck=" + imageCheck + ", regDate=" + regDate + "]";
	}	
	
	
}
