package com.project.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageVO;
import com.project.domain.SaraminVO;
import com.project.domain.SearchPageVO;

@Repository
public class TblSaraminDAOImpl implements TblSaraminDAO{
	
	@Inject
	SqlSession session;
	
	public static final String namespace="com.project.mapper.TblSaraminMapper";
	
	@Override
	public void insertBoard(SaraminVO vo) {
		session.insert(namespace+".insertBoard", vo);
	}


	@Override
	public Date getLastDate() {
		return session.selectOne(namespace+".getLastDate");
	}


	@Override
	public void deleteBoard(Integer id) {
		session.delete(namespace+".deleteBoard", id);
	}

	@Override
	public SaraminVO selectBoard(Integer id) {
		return session.selectOne(namespace+".selectBoard", id);
	}
	
	@Override
	public List<SaraminVO> selectBoardPage(PageVO vo) {
		return session.selectList(namespace+".selectBoardPage", vo);
	}


	@Override
	public int totalRecordCount() {
		return session.selectOne(namespace+".totalRecordCount");
	}


	@Override
	public List<SaraminVO> selectSearchBoardPage(SearchPageVO vo) {
		return session.selectList(namespace+".selectSearchBoardPage", vo);
	}


	@Override
	public int searchRecordCount(SearchPageVO vo) {
		return session.selectOne(namespace+".searchRecordCount", vo);
	}


	@Override
	public void updateReplyCnt(Integer id, int amount) {
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("id", id);
		paramMap.put("amount", amount);
		session.update(namespace+".updateReplyCnt", paramMap);
	}


	@Override
	public void updateViewCnt(Integer id) {
		session.update(namespace+".updateViewCnt", id);
	}


	@Override
	public List<SaraminVO> selectBestBoardPage(PageVO vo) {
		return session.selectList(namespace+".selectBestBoardPage", vo);
	}

}
