package com.project.service;

import java.util.Date;
import java.util.List;

import com.project.domain.PageVO;
import com.project.domain.SaraminVO;
import com.project.domain.SearchPageVO;

public interface TblSaraminService {
	
	public void regist(SaraminVO vo);

	public Date getLastDate();
	
	public SaraminVO read(Integer id);
	
	public List<SaraminVO> listPage(PageVO vo);
	
	public int totalRecordCount();
	
	public List<SaraminVO> listSearchPage(SearchPageVO vo);
	
	public int searchRecordCount(SearchPageVO vo);
	
	public void remove(Integer id);
	
	public List<SaraminVO> listBestPage(PageVO vo);
	
}
