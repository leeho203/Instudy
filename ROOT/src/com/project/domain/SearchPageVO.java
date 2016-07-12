package com.project.domain;

public class SearchPageVO extends PageVO {

	private String searchType;
	private String keyword;
	
	/*		setter		*/
	public void setSearchType(String searchType){
		this.searchType=searchType;
	}
	
	public void setKeyword(String keyword){
		this.keyword=keyword;
	}
	
	/*		getter		*/
	public String getSearchType(){
		return searchType;
	}
	
	public String getKeyword(){
		return keyword;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+searchType+", "
				+keyword+"]";
	}
	
}
