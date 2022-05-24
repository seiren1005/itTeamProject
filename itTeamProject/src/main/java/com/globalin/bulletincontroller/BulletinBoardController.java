package com.globalin.bulletincontroller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.bulletindomain.BulletinBoardPage;
import com.globalin.bulletindomain.BulletinBoardVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinservice.BulletinBoardService;

@Controller
@RequestMapping("/bulletinboard/*")
// response for '/board/...' requests  
public class BulletinBoardController {
	
	private Logger log =
		LoggerFactory.getLogger(BulletinBoardController.class);
	// logger for printing errors or execution messages
	
	@Autowired
	private BulletinBoardService service;
	
	
	// /board/list get 요청
	@GetMapping("/bulletinList")
	public void list(BulletinCriteria cri, Model model) {
		
//		log.info("list ");
		
		model.addAttribute("list", service.getList(cri));
		
		// page processing
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		model.addAttribute("pageMaker", new BulletinBoardPage(cri, total));
	
	}
		
	
	// /board/register get request
	@GetMapping("/bulletinRegister")
	public void register() {
		
		// register.jsp 로 이동
		
	}
	
	
	// /board/register post request
	@PostMapping("/bulletinRegister")
	public String register(BulletinBoardVO bvo, RedirectAttributes rttr, 
			HttpServletRequest req) {
		
		log.info("register: " + bvo);
		service.register(bvo);
		
		// 첨부파일
		BulletinFileVO fvo = new BulletinFileVO();
		
		fvo.setFileName(req.getParameter("pathInput"));
		fvo.setBno(bvo.getBno());
		service.registerFile(fvo);
		
		// diposable storage object
		rttr.addFlashAttribute("result", bvo.getBno());
		
		return "redirect:/bulletinboard/bulletinList";
		// response 객체가 없어서 직접 사용할 수 없고 return
		// 할 String 에 표시해서 사용
		
	}
	
	
	// /board/get, /board/update get request
	@GetMapping({"/bulletinGet", "/bulletinModify"})
	public void get(@RequestParam("bno") int bno,
			BulletinCriteria cri, Model model) {
		// bno 가 전달받는 파라미터임을 강조
		
		log.info("Get or update: " + bno);
		log.info("cri: " + cri);
		
		// 게시글 정보 전달
		BulletinBoardVO bvo = service.get(bno);
		model.addAttribute("board", bvo);
		
		// 페이지 정보 전달
		model.addAttribute("cri", cri);
		
	}
	
	
	// /board/update post request
	@PostMapping("/bulletinUpdate")
	public String modify(BulletinBoardVO bvo, BulletinCriteria cri, RedirectAttributes rttr) {
		
		log.info("update: " + bvo);
		
		if(service.modify(bvo) == true) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/bulletinboard/bulletinList";
		
	}
	
	
	// /board/delete post request
	@PostMapping("/bulletinDelete")
	public String remove(@RequestParam("bno") int bno, BulletinCriteria cri,
			RedirectAttributes rttr) {
		
		log.info("Delete: " + bno);
		
		if(service.remove(bno)) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		
		// 페이지, 검색 정보 전달
		rttr.addAttribute("cri", cri);
		
		return "redirect:/bulletinBoard/bulletinList";
		
	}
	
	
}
