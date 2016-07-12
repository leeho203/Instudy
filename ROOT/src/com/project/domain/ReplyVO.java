package com.project.domain;

import java.util.Date;

public class ReplyVO {

	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date moddate;
	
	/*		getter		*/
	public Integer getRno(){
		return rno;
	}
	
	public Integer getBno(){
		return bno;
	}
	
	public String getReplytext(){
		return replytext;
	}
	
	public String getReplyer(){
		return replyer;
	}
	
	public Date getRegdate(){
		return regdate;
	}
	
	public Date getModdate(){
		return moddate;
	}
	
	/*		setter		*/
	public void setRno(Integer rno){
		this.rno=rno;
	}
	
	public void setBno(Integer bno){
		this.bno=bno;
	}
	
	public void setReplytext(String replytext){
		this.replytext=replytext;
	}
	
	public void setReplyer(String replyer){
		this.replyer=replyer;
	}
	
	public void setRegdate(Date regdate){
		this.regdate=regdate;
	}
	
	public void setModdate(Date moddate){
		this.moddate=moddate;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+rno+", "
				+bno+", "
				+replytext+", "
				+replyer+", "
				+regdate+", "
				+moddate+"]";
	}
	
	
}
