package com.project.domain;

import java.util.Date;

public class ScheduleVO {
	
	private Integer sno;
	private String title;
	private String writer;
	private String color;
	private boolean allday;
	private Date startdate;
	private Date enddate;
	
	/*		getter		*/
	public Integer getSno(){
		return sno;
	}
	
	public String getTitle(){
		return title;
	}
	
	public String getWriter(){
		return writer;
	}
	
	public String getColor(){
		return color;
	}

	public boolean getAllday(){
		return allday;
	}
	
	public Date getStartdate(){
		return startdate;
	}
	
	public Date getEnddate(){
		return enddate;
	}
	
	/*		setter		*/
	public void setSno(Integer sno){
		this.sno=sno;
	}
	
	public void setTitle(String title){
		this.title=title;
	}
	
	public void setWriter(String writer){
		this.writer=writer;
	}
	
	public void setColor(String color){
		this.color=color;
	}
	
	public void setAllday(boolean allday){
		this.allday=allday;
	}
	
	public void setStartdate(Date startdate){
		this.startdate=startdate;
	}
	
	public void setEnddate(Date enddate){
		this.enddate=enddate;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+sno+", "
				+title+", "
				+writer+", "
				+color+", "
				+allday+", "
				+startdate+", "
				+enddate+"]";
	}
	
	
	
	
}
