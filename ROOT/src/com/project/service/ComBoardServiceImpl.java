package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardVO;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;
import com.project.persistence.ComBoardDAO;

@Service
public class ComBoardServiceImpl implements ComBoardService{

	@Inject
	ComBoardDAO comBoardDAO;
	
	@Override
	public void regist(BoardVO vo) {
		comBoardDAO.insertBoard(vo);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) {
		comBoardDAO.updateViewCnt(bno);
		return comBoardDAO.selectBoard(bno);
	}

	@Override
	public List<BoardVO> listAll() {
		return comBoardDAO.selectBoardAll();
	}
	
	@Override
	public List<BoardVO> listPage(PageVO vo) {
		return comBoardDAO.selectBoardPage(vo);
	}
	
	@Override
	public int totalRecordCount() {
		return comBoardDAO.totalRecordCount();
	}

	@Override
	public List<BoardVO> listSearchPage(SearchPageVO vo) {
		return comBoardDAO.selectSearchBoardPage(vo);
	}

	@Override
	public int searchRecordCount(SearchPageVO vo) {
		return comBoardDAO.searchRecordCount(vo);
	}
	
	@Override
	public void remove(Integer bno) {
		comBoardDAO.deleteBoard(bno);
	}

	@Override
	public void modify(BoardVO vo) {
		comBoardDAO.updateBoard(vo);
	}

	@Override
	public List<BoardVO> listBestPage(PageVO vo) {
		return comBoardDAO.selectBestBoardPage(vo);
	}


}
