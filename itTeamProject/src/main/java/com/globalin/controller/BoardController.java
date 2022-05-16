package com.globalin.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
// response for '/board/...' requests  
public class BoardController {
	
	private Logger log =
		LoggerFactory.getLogger(BoardController.class);
	// logger for printing errors or execution messages
	
	@GetMapping("/list")
	public void list() {
		
		log.info("list page");
		
	}
	
	
	
}
