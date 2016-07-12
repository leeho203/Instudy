package com.project.persistence;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;

public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO selectMember(LoginDTO dto);
	
	public void updateMember(MemberVO vo);
	
	
}
