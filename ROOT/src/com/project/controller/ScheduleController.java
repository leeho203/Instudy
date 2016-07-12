package com.project.controller;

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

import com.project.domain.ScheduleVO;
import com.project.service.ScheduleService;

@RestController
@RequestMapping("/schedule")
public class ScheduleController {

	@Inject
	ScheduleService scheduleService;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<Integer> register(@RequestBody ScheduleVO vo){
		
		ResponseEntity<Integer> entity=null;
		
		try{
			entity=new ResponseEntity<Integer>(scheduleService.registSchedule(vo), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/all/{writer}", method=RequestMethod.GET)
	public ResponseEntity<List<ScheduleVO>> read(@PathVariable("writer") String writer){
		
		ResponseEntity<List<ScheduleVO>> entity=null;
		
		try{
			List<ScheduleVO> list = scheduleService.listSchedule(writer);
			entity=new ResponseEntity<List<ScheduleVO>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/{sno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("sno")Integer sno, @RequestBody ScheduleVO vo){
		
		ResponseEntity<String> entity=null;

		try{
			vo.setSno(sno);
			scheduleService.modifySchedule(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{sno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("sno")Integer sno){
		
		ResponseEntity<String> entity=null;
		
		try{
			scheduleService.removeSchedule(sno);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
}
