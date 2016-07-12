package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.PageVO;
import com.project.domain.ReplyVO;
import com.project.persistence.TblSaraminDAO;
import com.project.persistence.TblSaraminReplyDAO;

@Service
public class SaraminReplyServiceImpl implements SaraminReplyService{

	@Inject
	TblSaraminReplyDAO saraminReplyDAO;
	
	@Inject
	TblSaraminDAO tblSaraminDAO;
	
	@Transactional
	@Override
	public void registReply(ReplyVO vo) {
		tblSaraminDAO.updateReplyCnt(vo.getBno(), 1);
		saraminReplyDAO.insertReply(vo);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) {
		tblSaraminDAO.updateReplyCnt(saraminReplyDAO.getBno(rno), -1);
		saraminReplyDAO.deleteReply(rno);
	}

	@Override
	public ReplyVO getReply(Integer rno) {
		return saraminReplyDAO.selectReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyAll(Integer bno) {
		return saraminReplyDAO.selectReplyAll(bno);
	}
	
	@Override
	public List<ReplyVO> getReplyPage(Integer bno, PageVO vo) {
		return saraminReplyDAO.selectReplyPage(bno, vo);
	}

	@Override
	public int totalReplyCount(Integer bno) {
		return saraminReplyDAO.totalReplyCount(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		saraminReplyDAO.updateReply(vo);
	}



}
