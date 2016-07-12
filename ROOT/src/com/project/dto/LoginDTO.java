package com.project.dto;

public class LoginDTO {
	private String userid;
	private String userpw;
	private boolean useCookie;
	
	/*		getter		*/
	public String getUserid(){
		return userid;
	}
	
	public String getUserpw(){
		return userpw;
	}
	
	public boolean getUseCookie(){
		return useCookie;
	}
	
	/*		setter		*/
	public void setUserid(String userid){
		this.userid=userid;
	}
	
	public void setUserpw(String userpw){
		this.userpw=userpw;
	}
	
	public void setUseCookie(boolean useCookie){
		this.useCookie=useCookie;
	}
	
	/*		toString()		*/
	@Override
	public String toString(){
		return "["+userid+", "
				+userpw+", "
				+useCookie+"]";
	}
	
}
