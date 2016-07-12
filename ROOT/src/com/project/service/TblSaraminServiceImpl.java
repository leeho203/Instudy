package com.project.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.PageVO;
import com.project.domain.SaraminVO;
import com.project.domain.SearchPageVO;
import com.project.persistence.TblSaraminDAO;

@Service
public class TblSaraminServiceImpl implements TblSaraminService{

	@Inject
	TblSaraminDAO tblSaraminDAO;
	
	@Transactional
	@Override
	public void regist(SaraminVO vo) {
		tblSaraminDAO.insertBoard(vo);
	}

	@Override
	public Date getLastDate() {
		return tblSaraminDAO.getLastDate();
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public SaraminVO read(Integer id) {
		tblSaraminDAO.updateViewCnt(id);
		return tblSaraminDAO.selectBoard(id);
	}

	@Override
	public List<SaraminVO> listPage(PageVO vo) {
		return tblSaraminDAO.selectBoardPage(vo);
	}

	@Override
	public int totalRecordCount() {
		return tblSaraminDAO.totalRecordCount();
	}

	@Override
	public List<SaraminVO> listSearchPage(SearchPageVO vo) {
		return tblSaraminDAO.selectSearchBoardPage(vo);
	}

	@Override
	public int searchRecordCount(SearchPageVO vo) {
		return tblSaraminDAO.searchRecordCount(vo);
	}

	@Override
	public void remove(Integer id) {
		tblSaraminDAO.deleteBoard(id);
	}

	@Override
	public List<SaraminVO> listBestPage(PageVO vo) {
		return tblSaraminDAO.selectBestBoardPage(vo);
	}
	

}
