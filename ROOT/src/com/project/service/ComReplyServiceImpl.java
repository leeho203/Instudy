package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;
import com.project.persistence.ComBoardDAO;
import com.project.persistence.ComReplyDAO;

@Service
public class ComReplyServiceImpl implements ComReplyService{

	@Inject
	ComReplyDAO comReplyDAO;
	
	@Inject
	ComBoardDAO comBoardDAO;
	
	@Transactional
	@Override
	public void registReply(ReplyVO vo) {
		comBoardDAO.updateReplyCnt(vo.getBno(), 1);
		comReplyDAO.insertReply(vo);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) {
		comBoardDAO.updateReplyCnt(comReplyDAO.getBno(rno), -1);
		comReplyDAO.deleteReply(rno);
	}

	@Override
	public ReplyVO getReply(Integer rno) {
		return comReplyDAO.selectReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyAll(Integer bno) {
		return comReplyDAO.selectReplyAll(bno);
	}
	
	@Override
	public List<ReplyVO> getReplyPage(Integer bno, PageVO vo) {
		return comReplyDAO.selectReplyPage(bno, vo);
	}

	@Override
	public int totalReplyCount(Integer bno) {
		return comReplyDAO.totalReplyCount(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		comReplyDAO.updateReply(vo);
	}



}
