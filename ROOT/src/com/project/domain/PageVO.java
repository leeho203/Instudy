package com.project.domain;

public class PageVO {
	private int page;
	private int perPageNum;
	
	public PageVO(){
		page=1;
		perPageNum=20;
	}
	
	/*		setter		*/
	public void setPage(int page){
		if(page<=0){
			this.page=1;
			return;
		}
		
		this.page=page;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum<=0){
			this.perPageNum=20;
			return;
		}
		
		this.perPageNum=perPageNum;
	}
	
	
	/*		getter		*/
	public int getPage(){
		return page;
	}
	
	public int getPerPageNum(){
		return perPageNum;
	}
	
	
	/*	method for getting startNum, endNum		
	 * 	example : 3 page -> startNum	equals to 40
	 * 						endNum		equals to 59	*/
	public int getStartNum(){
		return (this.page - 1) * this.perPageNum;
	}
	
	public int getEndNum(){
		return (this.page * this.perPageNum) - 1;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+page+", "
				+perPageNum+"]";
	}
	
}
