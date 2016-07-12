package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;
import com.project.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);		
	}
	
	@Override
	public MemberVO selectMember(LoginDTO dto) {
		return memberDAO.selectMember(dto);
	}

	

}
