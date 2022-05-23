package com.globalin.domain;

public class AttachFile {

	private String fileName;
	private String uploadPath;
	private String uuid;
	
	// check whether they are image files or not
	private boolean imageCheck;


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
		return "AttachFile [fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", imageCheck="
				+ imageCheck + "]";
	}
		
	
}
