package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.controller.TblSaraminController;
import com.project.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
							Object handler) throws Exception{
		HttpSession session=request.getSession();
		
		if(session.getAttribute("login")!=null){
			session.removeAttribute("login");
		}
		
		if(session.getAttribute("loginAdmin")!=null){
			session.removeAttribute("loginAdmin");
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
							Object handler, ModelAndView modelAndView) throws Exception{
		
		HttpSession session=request.getSession();
		ModelMap modelMap=modelAndView.getModelMap();
		MemberVO memberVO=(MemberVO)modelMap.get("memberVO");
		
		if(memberVO!=null){
			session.setAttribute("login", memberVO);
			if(memberVO.getUserid().equals("administrator")){
				session.setAttribute("loginAdmin", true);
			}
			
			response.sendRedirect("/");
		}	
	}
	
	
}
