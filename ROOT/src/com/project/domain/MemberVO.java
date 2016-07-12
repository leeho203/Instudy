package com.project.domain;

import java.util.Date;

public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String nickname;
	private Date regdate;
	private Date moddate;
	
	/*		getter		*/
	public String getUserid(){
		return userid;
	}
	
	public String getUserpw(){
		return userpw;
	}
	
	public String getUsername(){
		return username;
	}
	
	public String getEmail(){
		return email;
	}
	
	public String getNickname(){
		return nickname;
	}
	
	public Date getRegdate(){
		return regdate;
	}
	
	public Date getModdate(){
		return moddate;
	}
	
	
	/*		setter		*/
	public void setUserid(String userid){
		this.userid=userid;
	}
	
	public void setUserpw(String userpw){
		this.userpw=userpw;
	}
	
	public void setUsername(String username){
		this.username=username;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	public void setNickname(String nickname){
		this.nickname=nickname;
	}
	
	public void setRegdate(Date regdate){
		this.regdate=regdate;
	}
	
	public void setModdate(Date moddate){
		this.moddate=moddate;
	}
	
	/*		toString()		*/
	public String toString(){
		return "["+userid+", "
				+userpw+", "
				+username+", "
				+email+", "
				+nickname+", "
				+regdate+", "
				+moddate+"]";
	}
	
}
