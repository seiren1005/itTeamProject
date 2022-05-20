package com.globalin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.globalin.domain.AttachFile;
import com.globalin.domain.AttachmentVO;

import net.coobird.thumbnailator.Thumbnailator;


@Controller
public class UploadController2 {

	private Logger log = 
			LoggerFactory.getLogger(UploadController2.class);
		
	
	// remove attached file
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		
		log.info("Delete attached files: " + fileName);
		
		// Declare removing object ahead
		File file;
		
		try {
			file = new File("c:\\temp\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			// remove original files
			file.delete();
			
			if(type.equals("image")) {
				
				String sName = file.getAbsolutePath().replace("s_", "");
				
				// remove thumbnail files
				file = new File(sName);
				file.delete();
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<>("Delete Compoletely.", HttpStatus.OK);
		
	}
	
	
	// Treat downloads request
	@GetMapping(value="/download", 
			produces= {MediaType.APPLICATION_OCTET_STREAM_VALUE})
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		
		log.info("Download files: " + fileName);
		
		// resource object for return
		Resource resource = new FileSystemResource("c:\\temp\\" + fileName);
		
		String resourceName = resource.getFilename();
		
		resourceName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attchment;filename=" + 
					new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"	));
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resource,headers, HttpStatus.OK);
		
	}
	
	
	// 서버에서 get 방식으로 이미지 파일을 가져올 수 있도록 처리
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		// 이미지 데이터를 byte[] 배열로 전송
		log.info("Transport a file: " + fileName);
		
		File file = new File("C:\\temp\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		// byte[] 배열로 이미지 파일의 데이터를 브라우저에게 전송
		// media type 통해 브라우저에게 파일의 종류 알려줘야 함
		try {
			HttpHeaders header = new HttpHeaders();
			
			// 헤더에 content type 설정 정보 추가
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			// file 객체를 byte 배열로 바꿔서 전송
			result = new ResponseEntity<byte[]>(
					FileCopyUtils.copyToByteArray(file),
					header, // header 정보 포함
					HttpStatus.OK // status 포함
					);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	@GetMapping("/uploadAjax")
	public void uploadForm() {
		
		log.info("Upload files using AJAX");
		
	}
	
	
	@PostMapping(value="/uploadAjaxAction", 
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AttachmentVO>> 
		uploadAjaxAction(MultipartFile[] uploadFile, String uploadPath) {
		
		log.info("Upload by AJAX post");
		
		List<AttachmentVO> list = new ArrayList<>();
		
		for(MultipartFile file: uploadFile) {
			
			log.info("================================");
			log.info("File: " + file.getOriginalFilename());
			// .getOriginalfilename() -> 파일의 이름 반환
			// .getName() -> input tag 의 name attribute 값을 반환
			
			// 파일 객체 생성시, 저장할 위치, 파일 이름 필요
			String uploadFileName = file.getOriginalFilename();
			String savePath = calcPath(uploadPath);
			
			UUID uuid = UUID.randomUUID();
			
			AttachmentVO attach = new AttachmentVO();
			attach.setUuid(uuid.toString());
			attach.setSavePath(savePath);
			
			// 저장할 파일 이름에 uuid_filename 형식으로 저장
			uploadFileName = uuid.toString() + "_" + uploadFileName;			
			attach.setFileName(uploadFileName);
			
			File saveFile = new File(uploadPath + savePath, uploadFileName);
			
			
			try {				
				file.transferTo(saveFile);
				// transeferTo() -> 파일 업로드 메서드
				
				// create thumbnail when file is an image type
				if(checkImageType(saveFile) == true) {
					
					attach.setImgCheck("yes");
					
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uploadFileName));
					
					// create thumbnail using library
					Thumbnailator.createThumbnail(file.getInputStream(),
							thumbnail, 100, 100);
					
					thumbnail.close();
					
				}
				
				if(checkImageType(saveFile) == false) {
					
					attach.setImgCheck("no");
					
				}
				
				list.add(attach);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	
	// 업로드하는 파일이 이미지 파일인지 검사
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	
	// 날짜별 경로 추출
	private static String calcPath(String uploadPath) {
		
		Calendar calendar = Calendar.getInstance();
		
		String[] paths = new String[3];
		
		// year
		paths[0] = File.separator + calendar.get(Calendar.YEAR);
		
		// month
		paths[1] = paths[0] + File.separator 
				+ new DecimalFormat("00")
					.format(calendar.get(Calendar.MONTH) + 1 ); 
		
		// date
		paths[2] = paths[1] + File.separator 
				+ new DecimalFormat("00").format(calendar.get(Calendar.DATE));
		
		makeDir(uploadPath, paths);
		
		return paths[2];
		
	} // end 날짜별 경로 추출
	
	
	// 파일 저장 경로
	private static void makeDir(String uploadPath, String[] paths) {
		
		if(new File(uploadPath + paths[paths.length-1]).exists()) {
			// 기본경로 + 날짜 경로가 이미 존재 -> 메서드 종료
			return;
			
		}
		
		// 날짜 경로가 없으면 생성
		for(String path: paths) {
			// 기본경로 + 날짜 경로 파일 객체 생성
			File dirPath = new File(uploadPath + path);
			
			// 파일 객체에 해당하는 경로가 없으면
			if(!dirPath.exists()) {
				// 경로 생성
				dirPath.mkdir();
			}
		}		
		
	} // end 파일 저장 경로
	
	
	
}
