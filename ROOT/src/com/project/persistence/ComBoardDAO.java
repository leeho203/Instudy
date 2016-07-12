package com.project.persistence;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.PageVO;
import com.project.domain.SearchPageVO;

public interface ComBoardDAO {
	
	public void insertBoard(BoardVO vo);
	
	public void deleteBoard(Integer bno);
	
	public BoardVO selectBoard(Integer bno);
	
	public List<BoardVO> selectBoardAll();

	public List<BoardVO> selectBoardPage(PageVO vo);

	public int totalRecordCount();
	
	public List<BoardVO> selectSearchBoardPage(SearchPageVO vo);
	
	public int searchRecordCount(SearchPageVO vo);
	
	public void updateBoard(BoardVO vo);
	
	public void updateReplyCnt(Integer bno, int amount);
	
	public void updateViewCnt(Integer bno);
	
	public List<BoardVO> selectBestBoardPage(PageVO vo);
	
}