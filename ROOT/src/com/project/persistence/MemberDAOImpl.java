package com.project.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace="com.project.mapper.MemberMapper";

	@Override
	public void insertMember(MemberVO vo) {
		session.insert(namespace+".insertMember", vo);
	}

	@Override
	public MemberVO selectMember(LoginDTO dto) {
		return session.selectOne(namespace+".selectMember", dto);
	}

	@Override
	public void updateMember(MemberVO vo) {
		session.update(namespace+".updateMember", vo);
	}
	
	


}
