package com.project.controller;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.project.domain.PageMaker;
import com.project.domain.PageVO;
import com.project.domain.SaraminVO;
import com.project.domain.SearchPageVO;
import com.project.service.TblSaraminService;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Controller
@RequestMapping("/tblsaramin")
public class TblSaraminController {
	
	@Inject
	TblSaraminService service;
	
	private static final Logger logger=LoggerFactory.getLogger(TblSaraminController.class);
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void regist(){

		int page = 0;											//	xml파일의 현재 page
		int perPageNum = 100;									//	xml파일의 page당 레코드 갯수
		long publishedMinDate=service.getLastDate().getTime() / 1000L + 1;	//	tbl_saramin의 최신 posting(unix timestamp)에 1을 더하여 등록일시 최소값으로 설정해줌
		
		try{
				/*		xml 파일에서 total 레코드 수와 page 수를 먼저 가져옴		*/
				DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
				DocumentBuilder builder=factory.newDocumentBuilder();
				Document doc=builder.parse("http://api.saramin.co.kr/job-search?start="+page+"&count="+perPageNum+"&published_min="+publishedMinDate+"&bbs_gb=1&job_type=1+4+11&edu_lv=0+3+8");
				NodeList jobsList=doc.getElementsByTagName("jobs");
				Element jobs=(Element)jobsList.item(0);
				int total = Integer.parseInt(jobs.getAttribute("total"));
				int	end = (total/perPageNum) + 1;
				
				/*		xml 파일을 파싱해서 tbl_saramin 테이블에 누적함		*/
				SaraminVO vo=new SaraminVO();
				
				for(page=0;page<end;page++){

					doc=builder.parse("http://api.saramin.co.kr/job-search?start="+page+"&count="+perPageNum+"&published_min="+publishedMinDate+"&bbs_gb=1&job_type=1+4+11&edu_lv=0+3+8");
					
					NodeList jobList=doc.getElementsByTagName("job");
					
					for(int i=0;i<jobList.getLength();i++){
						Element job = (Element)jobList.item(i);					
						
						NodeList idList=job.getElementsByTagName("id");
						vo.setId(Integer.parseInt(((Element)idList.item(0)).getFirstChild().getNodeValue()));
						
						NodeList urlList=job.getElementsByTagName("url");
						vo.setUrl(((Element)urlList.item(0)).getFirstChild().getNodeValue());
						
						NodeList activeList=job.getElementsByTagName("active");
						vo.setActive(((Element)activeList.item(0)).getFirstChild().getNodeValue());
						
						NodeList postingList=job.getElementsByTagName("posting-timestamp");
						Date posting=new Date(Integer.parseInt(((Element)postingList.item(0)).getFirstChild().getNodeValue())*1000L);
						vo.setPosting(posting);
						
						NodeList modificationList=job.getElementsByTagName("modification-timestamp");
						Date modification=new Date(Integer.parseInt(((Element)modificationList.item(0)).getFirstChild().getNodeValue())*1000L);
						vo.setModification(modification);
						
						NodeList openingList=job.getElementsByTagName("opening-timestamp");
						Date opening=new Date(Integer.parseInt(((Element)openingList.item(0)).getFirstChild().getNodeValue())*1000L);
						vo.setOpening(opening);
						
						NodeList expirationList=job.getElementsByTagName("expiration-timestamp");
						Date expiration=new Date(Integer.parseInt(((Element)expirationList.item(0)).getFirstChild().getNodeValue())*1000L);
						vo.setExpiration(expiration);
						
						NodeList closeTypeList=job.getElementsByTagName("close-type");
						vo.setCloseType(((Element)closeTypeList.item(0)).getFirstChild().getNodeValue());
						
						NodeList companyList=job.getElementsByTagName("company");
						Element company=(Element)companyList.item(0);
						NodeList nameList=company.getElementsByTagName("name");
						Element name=(Element)nameList.item(0);
						vo.setCompanyName(name.getFirstChild().getNodeValue());
						vo.setCompanyNameHref(name.getAttribute("href"));
						
						
						NodeList positionList=job.getElementsByTagName("position");
						Element position=(Element)positionList.item(0);
						
						NodeList titleList=position.getElementsByTagName("title");
						Element title=(Element)titleList.item(0);
						vo.setPositionTitle(title.getFirstChild().getNodeValue());
						
						NodeList locationList=position.getElementsByTagName("location");
						Element location=(Element)locationList.item(0);
						vo.setPositionLocation(location.getFirstChild().getNodeValue());
						
						NodeList jobTypeList=position.getElementsByTagName("job-type");
						Element jobType=(Element)jobTypeList.item(0);
						if(jobType==null||jobType.getFirstChild()==null||jobType.getFirstChild().getNodeValue()==null){
							vo.setPositionJobType("null");
						}else{
							vo.setPositionJobType(jobType.getFirstChild().getNodeValue());
						}
						
						NodeList industryList=position.getElementsByTagName("industry");
						Element industry=(Element)industryList.item(0);
						if(industry==null||industry.getFirstChild()==null||industry.getFirstChild().getNodeValue()==null){
							vo.setPositionIndustry("null");
						}else{
							vo.setPositionIndustry(industry.getFirstChild().getNodeValue());
						}
						
						NodeList jobCategoryList=position.getElementsByTagName("job-category");
						Element jobCategory=(Element)jobCategoryList.item(0);
						if(jobCategory==null||jobCategory.getFirstChild()==null||jobCategory.getFirstChild().getNodeValue()==null){
							vo.setPositionJobCategory("null");
						}else{
							vo.setPositionJobCategory(jobCategory.getFirstChild().getNodeValue());
						}
						
						NodeList openQuantityList=position.getElementsByTagName("open-quantity");
						Element openQuantity=(Element)openQuantityList.item(0);
						vo.setPositionOpenQuantity(openQuantity.getFirstChild().getNodeValue());
						
						NodeList experienceLevelList=position.getElementsByTagName("experience-level");
						Element experienceLevel=(Element)experienceLevelList.item(0);
						vo.setPositionExperienceLevel(experienceLevel.getFirstChild().getNodeValue());
						
						NodeList requiredEducationLevelList=position.getElementsByTagName("required-education-level");
						Element requiredEducationLevel=(Element)requiredEducationLevelList.item(0);
						vo.setPositionRequiredEducationLevel(requiredEducationLevel.getFirstChild().getNodeValue());
						
						
						NodeList keywordList=job.getElementsByTagName("keyword");
						Element keyword=((Element)keywordList.item(0));
						if(keyword==null||keyword.getFirstChild()==null||keyword.getFirstChild().getNodeValue()==null){
							vo.setKeyword("null");
						}else{
							vo.setKeyword(keyword.getFirstChild().getNodeValue());
						}
						
						NodeList salaryList=job.getElementsByTagName("salary");
						vo.setSalary(((Element)salaryList.item(0)).getFirstChild().getNodeValue());
						
						/*		url로 content(client side의 url페이지 중 company_contents부분만을 파싱)를 만들어줌		*/
						String content ="";
						
						try(WebClient webClient=new WebClient()){
							HtmlPage htmlPage=webClient.getPage(vo.getUrl());
							HtmlDivision div=htmlPage.getHtmlElementById("company_contents");
							content = div.asXml();
						}
						
						vo.setContent(content);
						
						/*logger.info(vo.getId()+", "+vo.getUrl()+", "+vo.getActive()+", "+
									vo.getPosting()+", "+vo.getModification()+", "+vo.getOpening()+", "+vo.getExpiration());*/
						//logger.info(vo.getCompanyName()+", "+vo.getCompanyNameHref());
						//logger.info(vo.getPositionTitle()+", "+vo.getPositionLocation()+", "+vo.getPositionJobType()+", "+vo.getPositionIndustry()+", "+vo.getPositionJobCategory()+", "+vo.getPositionOpenQuantity()+", "+vo.getPositionExperienceLevel()+", "+vo.getPositionRequiredEducationLevel());
						//logger.info(vo.getKeyword()+", "+vo.getSalary());
						
						service.regist(vo);
					}
					
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(SearchPageVO searchPageVO, Model model){
		model.addAttribute("list", service.listSearchPage(searchPageVO));
		
		/*		bestList		*/
		PageVO pageVO = new PageVO();
		pageVO.setPerPageNum(10);
		model.addAttribute("bestList", service.listBestPage(pageVO));
		
		/*		PageMaker		*/
		PageMaker pageMaker=new PageMaker();
		pageMaker.setPageVO(searchPageVO);
		
		pageMaker.setTotalCount(service.searchRecordCount(searchPageVO));

		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("id")int id, SearchPageVO searchPageVO, Model model) throws IOException{
		model.addAttribute("saraminVO", service.read(id));
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("id")int id, SearchPageVO searchPageVO, 
							RedirectAttributes rttr){
		service.remove(id);
		rttr.addAttribute("page", searchPageVO.getPage());
		rttr.addAttribute("perPageNum", searchPageVO.getPerPageNum());
		rttr.addAttribute("searchType", searchPageVO.getSearchType());
		rttr.addAttribute("keyword", searchPageVO.getKeyword());
		return "redirect:/tblsaramin/listPage";
	}
	
	
}
