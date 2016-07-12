package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.BoardVO;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;

@Repository
public class StuBoardDAOImpl implements StuBoardDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.project.mapper.StuBoardMapper";
	
	@Override
	public void insertBoard(BoardVO vo) {
		session.insert(namespace+".insertBoard", vo);
	}

	@Override
	public void deleteBoard(Integer bno) {
		session.delete(namespace+".deleteBoard", bno);
	}

	@Override
	public BoardVO selectBoard(Integer bno) {
		return session.selectOne(namespace+".selectBoard", bno);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		return session.selectList(namespace+".selectBoardAll");
	}

	@Override
	public List<BoardVO> selectBoardPage(PageVO vo) {		
		return session.selectList(namespace+".selectBoardPage", vo);
	}
	
	@Override
	public int totalRecordCount() {
		return session.selectOne(namespace+".totalRecordCount");
	}
	
	@Override
	public List<BoardVO> selectSearchBoardPage(SearchPageVO vo) {
		return session.selectList(namespace+".selectSearchBoardPage", vo);
	}
	
	@Override
	public int searchRecordCount(SearchPageVO vo) {
		return session.selectOne(namespace+".searchRecordCount", vo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		session.update(namespace+".updateBoard", vo);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) {
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		session.update(namespace+".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(Integer bno) {
		session.update(namespace+".updateViewCnt", bno);
	}

	@Override
	public List<BoardVO> selectBestBoardPage(PageVO vo) {
		return session.selectList(namespace+".selectBestBoardPage", vo);
	}









}
