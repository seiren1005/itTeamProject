package com.globalin.domain;

// 게시판 파일 업로드 정보 저장
public class FileVO {

	private String fileName, uploadPath, uuid;
	private boolean image;
	
	
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
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", image=" + image
				+ "]";
	}	
	
	
}
