package com.globalin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	private Logger log = 
			LoggerFactory.getLogger(CommonController.class);
	
	 
	// 프로젝트 실행시 보여줄 페이지
	@GetMapping("/")
	public String goHome()	{
		
		return "home";
		
	}
	
	
}
