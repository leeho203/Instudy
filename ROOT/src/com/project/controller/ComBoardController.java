package com.project.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.BoardVO;
import com.project.domain.PageMaker;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;
import com.project.service.ComBoardService;

@Controller
@RequestMapping("/comboard")
public class ComBoardController {
	
	private static final Logger logger=LoggerFactory.getLogger(ComBoardController.class);

	@Inject
	ComBoardService service;
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registGET(BoardVO boardVO, Model model){
		
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPOST(BoardVO boardVO, Model model){
		service.regist(boardVO);
		model.addAttribute("result", "success");
		return "redirect:/comboard/listPage";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model){
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(SearchPageVO searchPageVO, Model model){
		model.addAttribute("list", service.listSearchPage(searchPageVO));
		
		/*		bestList		*/
		PageVO pageVO = new PageVO();
		pageVO.setPerPageNum(10);
		model.addAttribute("bestList", service.listBestPage(pageVO));
		
		/*		PageMaker		*/
		PageMaker pageMaker=new PageMaker();
		pageMaker.setPageVO(searchPageVO);
		
		pageMaker.setTotalCount(service.searchRecordCount(searchPageVO));

		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno")int bno, SearchPageVO searchPageVO, Model model){
		model.addAttribute(service.read(bno));
		
		/*		bestList		*/
		PageVO pageVO = new PageVO();
		pageVO.setPerPageNum(10);
		model.addAttribute("bestList", service.listBestPage(pageVO));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno")int bno, SearchPageVO searchPageVO, Model model){
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO boardVO, SearchPageVO searchPageVO, 
							RedirectAttributes rttr){
		service.modify(boardVO);
		rttr.addAttribute("page", searchPageVO.getPage());
		rttr.addAttribute("perPageNum", searchPageVO.getPerPageNum());
		rttr.addAttribute("searchType", searchPageVO.getSearchType());
		rttr.addAttribute("keyword", searchPageVO.getKeyword());
		return "redirect:/comboard/listPage";
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, SearchPageVO searchPageVO, 
							RedirectAttributes rttr){
		service.remove(bno);
		rttr.addAttribute("page", searchPageVO.getPage());
		rttr.addAttribute("perPageNum", searchPageVO.getPerPageNum());
		rttr.addAttribute("searchType", searchPageVO.getSearchType());
		rttr.addAttribute("keyword", searchPageVO.getKeyword());
		return "redirect:/comboard/listPage";
	}
	
}
