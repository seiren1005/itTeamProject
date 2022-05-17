package com.globalin.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;
import com.globalin.service.ReplyService;

@RestController
// 주의점
// 외부에서 서버 호출시 데이터의 포맷, 서버에서 보여주는 데이터의
// 	포맷을 명확하게 알 수 있도록 함
// 정상적으로 처리되었는지 HTTP STATUS 코드 리턴해서 알려줌
@RequestMapping("/replies/")
public class ReplyController {
	
	private Logger log = 
			LoggerFactory.getLogger(UploadController.class);
	
	@Autowired
	private ReplyService service;
	
	
	// /replies/new post request
	@PostMapping(value="/new", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
		// consumes browser -> server
		// produces server -> browser
	public ResponseEntity<String> register(@RequestBody ReplyVO rvo) {
		
		int result = service.register(rvo);
						
		return result == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	// 조회
	// /replies/rno
	
	
	// 삭제
	// /replies/rno
	@DeleteMapping(value="/{rno}", 
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO rvo,
			@PathVariable("rno") int rno) {
		
		return service.delete(rno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 수정
	// /replies/rno
	@PutMapping(value="/{rno}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@PathVariable("rno") int rno, @RequestBody ReplyVO rvo) {
		
		rvo.setRno(rno);
		
		return service.update(rvo) == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	// reply list with paging
	// /replies/rno/page get request
	@GetMapping(value="/pages/{bno}/{page}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPage> getList(
			@PathVariable("bno") int bno, @PathVariable("page") int page) {
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		cri.setAmount(10);
		
		return new ResponseEntity<>(
				service.getReplyListWithPage(cri, bno), HttpStatus.OK);
		
	}
	

}
