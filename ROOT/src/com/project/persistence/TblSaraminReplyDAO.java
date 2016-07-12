package com.project.persistence;

import java.util.List;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;

public interface TblSaraminReplyDAO {

	public void insertReply(ReplyVO vo);
	
	public void deleteReply(Integer rno);
	
	public ReplyVO selectReply(Integer rno);
	
	public List<ReplyVO> selectReplyAll(Integer bno);
	
	public List<ReplyVO> selectReplyPage(Integer bno, PageVO vo);
	
	public int totalReplyCount(Integer bno);
	
	public void updateReply(ReplyVO vo);
	
	public int getBno(Integer rno);
	
}
