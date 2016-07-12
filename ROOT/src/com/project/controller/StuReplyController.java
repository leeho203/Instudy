package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.PageMaker;
import com.project.domain.PageVO;
import com.project.domain.ReplyVO;
import com.project.service.StuReplyService;

@RestController
@RequestMapping("/stureply")
public class StuReplyController {

	@Inject
	StuReplyService stuReplyService;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try{
			stuReplyService.registReply(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> getReplyAll(@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			List<ReplyVO> list=stuReplyService.getReplyAll(bno);
			entity=new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getReplyPage(@PathVariable("bno") Integer bno,
													@PathVariable("page") Integer page){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try{
			
			/*		PageVO 객체와 bno를 이용해서 해당 게시물의 해당 페이지를 List<ReplyVO>형태로 얻어옴		*/
			PageVO vo=new PageVO();
			vo.setPage(page);
			List<ReplyVO> list=stuReplyService.getReplyPage(bno, vo);
			
			/*		bno를 이용해서 해당 게시물의 댓글 개수 얻어오고 PageVO객체와 함께 pageMaker를 만들어줌		*/
			int replyCount=stuReplyService.totalReplyCount(bno);
			PageMaker pageMaker=new PageMaker();
			pageMaker.setPageVO(vo);
			pageMaker.setTotalCount(replyCount);
			
			/*		얻어온 List<ReplyVO>와 pageMaker를 넘겨줌		*/ 
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
			entity=new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modifyReply(@PathVariable("rno") Integer rno, 
											@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity = null;
		
		try{
			vo.setRno(rno);
			stuReplyService.modifyReply(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> removeReply(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		
		try{
			stuReplyService.removeReply(rno);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
