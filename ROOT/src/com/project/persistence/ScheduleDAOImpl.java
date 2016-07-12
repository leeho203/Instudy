package com.project.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.project.mapper.ScheduleMapper";
	
	@Override
	public void insertSchedule(ScheduleVO vo) {
		session.insert(namespace+".insertSchedule", vo);	
	}
	
	@Override
	public Integer getRecentSno() {
		return session.selectOne(namespace+".getRecentSno");
	}
	
	@Override
	public void deleteSchedule(Integer sno) {
		session.delete(namespace+".deleteSchedule", sno);		
	}

	@Override
	public List<ScheduleVO> selectScheduleAll(String writer) {
		return session.selectList(namespace+".selectScheduleAll", writer);
	}

	@Override
	public void updateSchedule(ScheduleVO vo) {
		session.update(namespace+".updateSchedule", vo);
		
	}

	

}
