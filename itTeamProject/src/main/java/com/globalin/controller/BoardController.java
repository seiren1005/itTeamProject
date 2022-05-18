package com.globalin.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.domain.BoardPage;
import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.service.BoardService;

@Controller
@RequestMapping("/board/*")
// response for '/board/...' requests  
public class BoardController {
	
	private Logger log =
		LoggerFactory.getLogger(BoardController.class);
	// logger for printing errors or execution messages
	
	@Autowired
	private BoardService service;
	
	
	// /board/list get 요청
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
//		log.info("list ");
		
		model.addAttribute("list", service.getList(cri));
		
		// page processing
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		model.addAttribute("pageMaker", new BoardPage(cri, total));
	
	}
		
		
	// /board/list get 요청2
	@GetMapping(value="/list/{purp}")
	public String list(Criteria cri, Model model, 
			@PathVariable("purp") String purp) {
		
//		log.info("list ");
		
		model.addAttribute("list", service.getList(cri, purp));
		
		// page processing
		int total = service.getTotal(cri, purp);
		
		log.info("total: " + total);
		model.addAttribute("pageMaker", new BoardPage(cri, total));
		
		return "redirect:/board/list";
		
						
			
		
//		if(purp == "/qna") {
//			
//			model.addAttribute("list", service.getList(cri, purp));
//			
//			// page processing
//			int total = service.getTotal(cri, purp);
//			
//			log.info("total: " + total);
//			model.addAttribute("pageMaker", new BoardPage(cri, total));
//			
//			return "redirect:/board/list";
//			
//		}
		
		
	}
	
	
//	@GetMapping("/list")
//	public void list(Criteria cri, Model model) {
//		
//		log.info("list ");
//		
//		model.addAttribute("list", service.getList(cri));
//		
//		// page processing
//		int total = service.getTotal(cri);
//		
//		log.info("total: " + total);
//		model.addAttribute("pageMaker", new BoardPage(cri, total));		
//		
//	}
//	
//	
//	@GetMapping(value="/list")
//	public void list(Criteria cri, Model model) {
//		
//		log.info("list ");
//		
//		model.addAttribute("list", service.getList(cri));
//		
//		// page processing
//		int total = service.getTotal(cri);
//		
//		log.info("total: " + total);
//		model.addAttribute("pageMaker", new BoardPage(cri, total));		
//		
//	}
	
	
	
	
	// /board/register get request
	@GetMapping("/register")
	public void register() {
		
		// register.jsp 로 이동
		
	}
	
	
	// /board/register post request
	@PostMapping("/register")
	public String register(BoardVO bvo, RedirectAttributes rttr) {
		
		log.info("register: " + bvo);
		service.register(bvo);
		
		// diposable storage object
		rttr.addFlashAttribute("result", bvo.getBno());
		
		return "redirect:/board/list";
		// response 객체가 없어서 직접 사용할 수 없고 return
		// 할 String 에 표시해서 사용
		
	}
	
	
	// /board/get, /board/update get request
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") int bno,
			Criteria cri, Model model) {
		// bno 가 전달받는 파라미터임을 강조
		
		log.info("Get or update: " + bno);
		log.info("cri: " + cri);
		
		// 게시글 정보 전달
		BoardVO bvo = service.get(bno);
		model.addAttribute("board", bvo);
		
		// 페이지 정보 전달
		model.addAttribute("cri", cri);
		
	}
	
	
	// /board/update post request
	@PostMapping("/update")
	public String modify(BoardVO bvo, Criteria cri, RedirectAttributes rttr) {
		
		log.info("update: " + bvo);
		
		if(service.modify(bvo) == true) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/board/list";
		
	}
	
	
	// /board/delete post request
	@PostMapping("/delete")
	public String remove(@RequestParam("bno") int bno, Criteria cri,
			RedirectAttributes rttr) {
		
		log.info("Delete: " + bno);
		
		if(service.remove(bno)) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지, 검색 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/board/list";
		
	}
	
	
}
