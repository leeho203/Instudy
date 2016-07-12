package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;
import com.project.persistence.StuBoardDAO;
import com.project.persistence.StuReplyDAO;

@Service
public class StuReplyServiceImpl implements StuReplyService{

	@Inject
	StuReplyDAO stuReplyDAO;
	
	@Inject
	StuBoardDAO stuBoardDAO;
	
	@Transactional
	@Override
	public void registReply(ReplyVO vo) {
		stuBoardDAO.updateReplyCnt(vo.getBno(), 1);
		stuReplyDAO.insertReply(vo);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) {
		stuBoardDAO.updateReplyCnt(stuReplyDAO.getBno(rno), -1);
		stuReplyDAO.deleteReply(rno);
	}

	@Override
	public ReplyVO getReply(Integer rno) {
		return stuReplyDAO.selectReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyAll(Integer bno) {
		return stuReplyDAO.selectReplyAll(bno);
	}
	
	@Override
	public List<ReplyVO> getReplyPage(Integer bno, PageVO vo) {
		return stuReplyDAO.selectReplyPage(bno, vo);
	}

	@Override
	public int totalReplyCount(Integer bno) {
		return stuReplyDAO.totalReplyCount(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		stuReplyDAO.updateReply(vo);
	}



}
