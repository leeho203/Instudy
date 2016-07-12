package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardVO;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;
import com.project.persistence.StuBoardDAO;

@Service
public class StuBoardServiceImpl implements StuBoardService{

	@Inject
	StuBoardDAO stuBoardDAO;
	
	@Override
	public void regist(BoardVO vo) {
		stuBoardDAO.insertBoard(vo);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) {
		stuBoardDAO.updateViewCnt(bno);
		return stuBoardDAO.selectBoard(bno);
	}

	@Override
	public List<BoardVO> listAll() {
		return stuBoardDAO.selectBoardAll();
	}
	
	@Override
	public List<BoardVO> listPage(PageVO vo) {
		return stuBoardDAO.selectBoardPage(vo);
	}
	
	@Override
	public int totalRecordCount() {
		return stuBoardDAO.totalRecordCount();
	}

	@Override
	public List<BoardVO> listSearchPage(SearchPageVO vo) {
		return stuBoardDAO.selectSearchBoardPage(vo);
	}

	@Override
	public int searchRecordCount(SearchPageVO vo) {
		return stuBoardDAO.searchRecordCount(vo);
	}
	
	@Override
	public void remove(Integer bno) {
		stuBoardDAO.deleteBoard(bno);
	}

	@Override
	public void modify(BoardVO vo) {
		stuBoardDAO.updateBoard(vo);
	}

	@Override
	public List<BoardVO> listBestPage(PageVO vo) {
		return stuBoardDAO.selectBestBoardPage(vo);
	}


}
