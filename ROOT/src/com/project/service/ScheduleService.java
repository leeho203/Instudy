package com.project.service;

import java.util.List;

import com.project.domain.ScheduleVO;

public interface ScheduleService {
	
	public Integer registSchedule(ScheduleVO vo);
	
	public void removeSchedule(Integer sno);
	
	public List<ScheduleVO> listSchedule(String writer);

	public void modifySchedule(ScheduleVO vo);
	
}
