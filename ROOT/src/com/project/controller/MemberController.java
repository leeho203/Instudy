package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberVO;
import com.project.dto.LoginDTO;
import com.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(){
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPost(LoginDTO dto, Model model){
		MemberVO vo = service.selectMember(dto);
		
		if(vo!=null){
			model.addAttribute("memberVO", vo); 
		}
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response,
						HttpSession session){
		Object login=session.getAttribute("login");
		Object loginAdmin=session.getAttribute("loginAdmin");
		
		if(login!=null){
			session.removeAttribute("login");
		}
		
		if(loginAdmin!=null){
			session.removeAttribute("loginAdmin");
		}
		
		return "/member/logout";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void signupGET(){
		
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPOST(MemberVO vo, Model model, HttpSession session){
		try{
			
			service.insertMember(vo);
			
		/*	SQL�� ���� �� ������ �۾�		*/
		}catch(Exception e){
			model.addAttribute("errorMessage", "���̵� �ߺ��Ǿ����ϴ�\r\n �ٸ����̵� �Է����ּ���");
			return "/member/signup";
		}
		
		/*	ȸ������ �Ϸ� �� ������ �۾�	*/
		session.setAttribute("login", vo);
		return "/index";
	}
	
}
