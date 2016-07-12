package com.project.service;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;

public interface StuBoardService {

	public void regist(BoardVO vo);
	
	public BoardVO read(Integer bno);
	
	public List<BoardVO> listAll();
	
	public List<BoardVO> listPage(PageVO vo);
	
	public int totalRecordCount();
	
	public List<BoardVO> listSearchPage(SearchPageVO vo);
	
	public int searchRecordCount(SearchPageVO vo);
	
	public void remove(Integer bno);
	
	public void modify(BoardVO vo);
	
	public List<BoardVO> listBestPage(PageVO vo);
	
}
