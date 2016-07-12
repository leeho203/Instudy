package com.project.persistence;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.project.domain.ScheduleVO;

@Repository
public interface ScheduleDAO {

	public void insertSchedule(ScheduleVO vo);

	public Integer getRecentSno();
	
	public void deleteSchedule(Integer sno);
	
	public List<ScheduleVO> selectScheduleAll(String writer);
	
	public void updateSchedule(ScheduleVO vo);
	
}
