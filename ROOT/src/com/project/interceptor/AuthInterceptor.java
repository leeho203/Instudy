package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.domain.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
						Object handler) throws Exception{
		
		HttpSession session=request.getSession();
		MemberVO vo=(MemberVO)session.getAttribute("login");
		
		if(vo!=null){
			return true;
		}
		
		response.sendRedirect("/member/login");
		return false;
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception{

	}
	
	
}
