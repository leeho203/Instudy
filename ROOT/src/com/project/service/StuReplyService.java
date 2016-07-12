package com.project.service;

import java.util.List;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;

public interface StuReplyService {
	
	public void registReply(ReplyVO vo);
	
	public void removeReply(Integer rno);
	
	public ReplyVO getReply(Integer rno);

	public List<ReplyVO> getReplyAll(Integer bno);
	
	public List<ReplyVO> getReplyPage(Integer bno, PageVO vo);
	
	public int totalReplyCount(Integer bno);
	
	public void modifyReply(ReplyVO vo);
	
}
