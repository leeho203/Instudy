package com.project.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	PageVO pageVO;
	
	/*		getter		*/
	public int getTotalCount(){
		return totalCount;
	}
	
	public int getStartPage(){
		return startPage;
	}
	
	public int getEndPage(){
		return endPage;
	}
	
	public boolean getPrev(){
		return prev;
	}
	
	public boolean getNext(){
		return next;
	}
	
	public int getDisplayPageNum(){
		return displayPageNum;
	}
	
	public PageVO getPageVO(){
		return pageVO;
	}
	
	
	/*		setter		*/
	public void setTotalCount(int totalCount){
		this.totalCount=totalCount;
		setData();
	}
	
	public void setStartPage(int startPage){
		this.startPage=startPage;
	}
	
	public void setEndPage(int endPage){
		this.endPage=endPage;
	}
	
	public void setPrev(boolean prev){
		this.prev=prev;
	}
	
	public void setNext(boolean next){
		this.next=next;
	}
	
	public void setDisplayPageNum(int displayPageNum){
		if(displayPageNum<=4){
			displayPageNum=4;
			return;
		}
			
		this.displayPageNum=displayPageNum;
	}
	
	public void setPageVO(PageVO pageVO){
		this.pageVO=pageVO;
	}
	
	/*		method for setting data		*/
	public void setData(){
		endPage=(int)(Math.ceil(pageVO.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage=(endPage - displayPageNum) + 1;
		
		int tempEndPage=(int)(Math.ceil(totalCount/(double)pageVO.getPerPageNum()));
		
		if(endPage>tempEndPage){
			endPage=tempEndPage;
		}
		
		prev = startPage==1?false:true;
		
		next = endPage*pageVO.getPerPageNum()>=totalCount?false:true;
		
	}
	
	public String makeQuery(int page){
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pageVO.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	
	public String makeSearchQuery(int page){
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pageVO.getPerPageNum())
				.queryParam("searchType", ((SearchPageVO)pageVO).getSearchType())
				.queryParam("keyword", ((SearchPageVO)pageVO).getKeyword())
				.build();
		return uriComponents.toUriString();
	}
	
}
