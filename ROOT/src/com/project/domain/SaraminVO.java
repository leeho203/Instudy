package com.project.domain;

import java.util.Date;

public class SaraminVO {
	private Integer id;
	private String url;
	private String active;
	private Date posting;
	private Date modification;
	private Date opening;
	private Date expiration;
	private String closeType;
	private String companyName;
	private String companyNameHref;
	private String positionTitle;
	private String positionLocation;
	private String positionJobType;
	private String positionIndustry;
	private String positionJobCategory;
	private String positionOpenQuantity;
	private String positionExperienceLevel;
	private String positionRequiredEducationLevel;
	private String keyword;
	private String salary;
	private Integer viewcnt;
	private Integer replycnt;
	private String content;
	
	/*		getter		*/
	public int getId(){
		return id;
	}
	
	public String getUrl(){
		return url;
	}
	
	public String getActive(){
		return active;
	}
	
	public Date getPosting(){
		return posting;
	}
	
	public Date getModification(){
		return modification;
	}
	
	public Date getOpening(){
		return opening;
	}
	
	public Date getExpiration(){
		return expiration;
	}
	
	public String getCloseType(){
		return closeType;
	}
	
	public String getCompanyName(){
		return companyName;
	}
	
	public String getCompanyNameHref(){
		return companyNameHref;
	}
	
	public String getPositionTitle(){
		return positionTitle;
	}
	
	public String getPositionLocation(){
		return positionLocation;
	}
	
	public String getPositionJobType(){
		return positionJobType;
	}

	public String getPositionIndustry(){
		return positionIndustry;
	}
	

	public String getPositionJobCategory(){
		return positionJobCategory;
	}
	

	public String getPositionOpenQuantity(){
		return positionOpenQuantity;
	}
	

	public String getPositionExperienceLevel(){
		return positionExperienceLevel;
	}
	

	public String getPositionRequiredEducationLevel(){
		return positionRequiredEducationLevel;
	}
	
	public String getKeyword(){
		return keyword;
	}
	
	public String getSalary(){
		return salary;
	}
	
	public Integer getViewcnt(){
		return viewcnt;
	}
	
	public Integer getReplycnt(){
		return replycnt;
	}
	
	public String getContent(){
		return content;
	}
	
	/*		setter		*/
	public void setId(Integer id){
		this.id=id;
	}
	
	public void setUrl(String url){
		this.url=url;
	}
	
	public void setActive(String active){
		this.active=active;
	}
	
	public void setPosting(Date posting){
		this.posting=posting;
	}
	
	public void setModification(Date modification){
		this.modification=modification;
	}
	
	public void setOpening(Date opening){
		this.opening=opening;
	}
	
	public void setExpiration(Date expiration){
		this.expiration=expiration;
	}
	
	public void setCloseType(String closeType){
		this.closeType=closeType;
	}
	
	public void setCompanyName(String companyName){
		this.companyName=companyName;
	}
	
	public void setCompanyNameHref(String companyNameHref){
		this.companyNameHref=companyNameHref;
	}
	
	public void setPositionTitle(String positionTitle){
		this.positionTitle=positionTitle;
	}
	
	public void setPositionLocation(String positionLocation){
		this.positionLocation=positionLocation;
	}
	
	public void setPositionJobType(String positionJobType){
		this.positionJobType=positionJobType;
	}
	
	public void setPositionIndustry(String positionIndustry){
		this.positionIndustry=positionIndustry;
	}
	
	public void setPositionJobCategory(String positionJobCategory){
		this.positionJobCategory=positionJobCategory;
	}
	
	public void setPositionOpenQuantity(String positionOpenQuantity){
		this.positionOpenQuantity=positionOpenQuantity;
	}
	
	public void setPositionExperienceLevel(String positionExperienceLevel){
		this.positionExperienceLevel=positionExperienceLevel;
	}
	
	public void setPositionRequiredEducationLevel(String positionRequiredEducationLevel){
		this.positionRequiredEducationLevel=positionRequiredEducationLevel;
	}
	
	public void setKeyword(String keyword){
		this.keyword=keyword;
	}
	
	public void setSalary(String salary){
		this.salary=salary;
	}	
	
	public void setViewcnt(Integer viewcnt){
		this.viewcnt=viewcnt;
	}
	
	public void setReplycnt(Integer replycnt){
		this.replycnt=replycnt;
	}
	
	public void setContent(String content){
		this.content=content;
	}
}
