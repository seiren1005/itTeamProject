package com.globalin.itTeamProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value="/board/list")
	public String list() {
	return "/board/list";
	}

	@RequestMapping(value="/newfile")
	public String newfile() {
	return "newfile";
	}
	
	@RequestMapping(value="/deteil/diteil-lifeCoding")
	public String lifecoding() {
	return "/deteil/diteil-lifeCoding";
	}
	
	@RequestMapping(value="/deteil/diteil-TCP")
	public String TCP() {
	return "/deteil/diteil-TCP";
	}

	@RequestMapping(value="/deteil/diteil-Tohoho")
	public String Tohoho() {
	return "/deteil/diteil-Tohoho";
	}
	
	
}
