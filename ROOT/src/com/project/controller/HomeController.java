package com.project.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.PageVO;
import com.project.service.ComBoardService;
import com.project.service.StuBoardService;
import com.project.service.TblSaraminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	StuBoardService stuBoardService;
	
	@Inject
	ComBoardService comBoardService;
	
	@Inject
	TblSaraminService tblSaraminService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
*/	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String index(Model model) {
		
		PageVO vo=new PageVO();
		vo.setPage(0);
		vo.setPerPageNum(10);
		model.addAttribute("stuBoardList", stuBoardService.listPage(vo));
		model.addAttribute("comBoardList", comBoardService.listPage(vo));
		
		vo.setPerPageNum(20);
		model.addAttribute("tblSaraminList", tblSaraminService.listPage(vo));
		
		vo.setPerPageNum(5);
		model.addAttribute("stuBestBoardList", stuBoardService.listBestPage(vo));
		model.addAttribute("comBestBoardList", comBoardService.listBestPage(vo));
		model.addAttribute("tblSaraminBestList", tblSaraminService.listBestPage(vo));
		return "index";
	}
	
	@RequestMapping(value="/schedule/page", method=RequestMethod.GET)
	public void schedulePage(){

	}
}
