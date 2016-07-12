package com.project.domain;

import java.util.Date;

public class BoardVO {

	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date moddate;
	private Integer viewcnt;
	private Integer replycnt;
	
	/*		getter		*/
	public Integer getBno(){
		return bno;
	}
	
	public String getTitle(){
		return title;
	}
	
	public String getContent(){
		return content;
	}
	
	public String getWriter(){
		return writer;
	}
	
	public Date getRegdate(){
		return regdate;
	}
	
	public Date getModdate(){
		return moddate;
	}
	
	public Integer getViewcnt(){
		return viewcnt;
	}
	
	public Integer getReplycnt(){
		return replycnt;
	}
	
	/*		setter		*/
	public void setBno(Integer bno){
		this.bno=bno;
	}
	
	public void setTitle(String title){
		this.title=title;
	}
	
	public void setContent(String content){
		this.content=content;
	}
	
	public void setWriter(String writer){
		this.writer=writer;
	}
	
	public void setRegdate(Date regdate){
		this.regdate=regdate;
	}
	
	public void setModdate(Date moddate){
		this.moddate=moddate;
	}
	
	public void setViewcnt(Integer viewcnt){
		this.viewcnt=viewcnt;
	}
	
	public void setReplycnt(Integer replycnt){
		this.replycnt=replycnt;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+bno+", "
				+title+", "
				+content+", "
				+writer+", "
				+regdate+", "
				+moddate+", "
				+viewcnt+", "
				+replycnt+"]";
	}
	
	
}
