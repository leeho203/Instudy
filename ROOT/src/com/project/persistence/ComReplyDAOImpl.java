package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;

@Repository
public class ComReplyDAOImpl implements ComReplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.project.mapper.ComReplyMapper";
	
	
	@Override
	public void insertReply(ReplyVO vo) {
		session.insert(namespace+".insertReply", vo);
	}

	@Override
	public void deleteReply(Integer rno) {
		session.delete(namespace+".deleteReply", rno);		
	}

	@Override
	public ReplyVO selectReply(Integer rno) {
		return session.selectOne(namespace+".selectReply", rno);
	}

	@Override
	public List<ReplyVO> selectReplyAll(Integer bno) {
		return session.selectList(namespace+".selectReplyAll", bno);
	}
	
	@Override
	public List<ReplyVO> selectReplyPage(Integer bno, PageVO vo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("pageVO", vo);
		return session.selectList(namespace+".selectReplyPage", paramMap);
	}

	@Override
	public int totalReplyCount(Integer bno) {
		return session.selectOne(namespace+".totalReplyCount", bno);
	}
	
	@Override
	public void updateReply(ReplyVO vo) {
		session.update(namespace+".updateReply", vo);		
	}

	@Override
	public int getBno(Integer rno) {
		return (Integer)session.selectOne(namespace+".getBno", rno);
	}

	
}
