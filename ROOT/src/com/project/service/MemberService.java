package com.project.service;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;

public interface MemberService {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO selectMember(LoginDTO dto);
	
}
