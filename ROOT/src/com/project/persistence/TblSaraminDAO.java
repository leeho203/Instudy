package com.project.persistence;

import java.util.Date;
import java.util.List;

import com.project.domain.PageVO;
import com.project.domain.SaraminVO;
import com.project.domain.SearchPageVO;

public interface TblSaraminDAO {
	
	public void insertBoard(SaraminVO vo);
	
	public Date getLastDate();
	
	public void deleteBoard(Integer id);
	
	public SaraminVO selectBoard(Integer id);
	
	public List<SaraminVO> selectBoardPage(PageVO vo);

	public int totalRecordCount();
	
	public List<SaraminVO> selectSearchBoardPage(SearchPageVO vo);
	
	public int searchRecordCount(SearchPageVO vo);
	
	//public void updateBoard(SaraminVO vo);
	
	public void updateReplyCnt(Integer id, int amount);
	
	public void updateViewCnt(Integer id);
	
	public List<SaraminVO> selectBestBoardPage(PageVO vo);
	
}
