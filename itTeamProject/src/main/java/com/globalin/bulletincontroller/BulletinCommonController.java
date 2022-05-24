package com.globalin.bulletincontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BulletinCommonController {

	private Logger log = 
			LoggerFactory.getLogger(BulletinCommonController.class);
	
	 
	// 프로젝트 실행시 보여줄 페이지
	@GetMapping("/")
	public String goHome()	{
		
		return "home";
		
	}
	
	
}
