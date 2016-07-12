package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ScheduleVO;
import com.project.persistence.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Inject
	ScheduleDAO scheduleDAO;
	
	@Transactional
	@Override
	public Integer registSchedule(ScheduleVO vo) {
		scheduleDAO.insertSchedule(vo);
		return scheduleDAO.getRecentSno();
	}
	
	@Override
	public void removeSchedule(Integer sno) {
		scheduleDAO.deleteSchedule(sno);
	}

	@Override
	public List<ScheduleVO> listSchedule(String writer) {
		return scheduleDAO.selectScheduleAll(writer);
	}

	@Override
	public void modifySchedule(ScheduleVO vo) {
		scheduleDAO.updateSchedule(vo);
	}

	

}
