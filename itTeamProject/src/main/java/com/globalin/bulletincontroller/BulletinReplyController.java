package com.globalin.bulletincontroller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinReplyPage;
import com.globalin.bulletindomain.BulletinReplyVO;
import com.globalin.bulletinservice.BulletinReplyService;

@RestController
// 주의점
// 외부에서 서버 호출시 데이터의 포맷, 서버에서 보여주는 데이터의
// 	포맷을 명확하게 알 수 있도록 함
// 정상적으로 처리되었는지 HTTP STATUS 코드 리턴해서 알려줌
@RequestMapping("/replies/")
public class BulletinReplyController {
	
	private Logger log = 
			LoggerFactory.getLogger(BulletinUploadController.class);
	
	@Autowired
	private BulletinReplyService service;
	
	
	// /replies/new post request
	@PostMapping(value="/new", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
		// consumes browser -> server
		// produces server -> browser
	public ResponseEntity<String> register(@RequestBody BulletinReplyVO rvo) {
		
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
	public ResponseEntity<String> remove(@RequestBody BulletinReplyVO rvo,
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
			@PathVariable("rno") int rno, @RequestBody BulletinReplyVO rvo) {
		
		rvo.setRno(rno);
		
		System.out.println("rvo: " + rvo);
		
		return service.update(rvo) == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	// reply list with paging
	// /replies/rno/page get request
	@GetMapping(value="/pages/{bno}/{page}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BulletinReplyPage> getList(
			@PathVariable("bno") int bno, 
			@PathVariable("page") int page, Model model) {
		
//		System.out.println("is getList working?");
//		System.out.println("controller bno: " + bno);
		
		BulletinCriteria cri = new BulletinCriteria();
		cri.setPageNum(page);
		cri.setAmount(10);
						
//		System.out.println("controller return: " + service.getReplyListWithPage(cri, bno));
		
		return new ResponseEntity<>(
				service.getReplyListWithPage(cri, bno), HttpStatus.OK);
		
	}
	

}
