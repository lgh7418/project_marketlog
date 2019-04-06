package com.company.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.MemberVO;
import com.company.dto.LoginDTO;
import com.company.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET() {
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, Model model) throws Exception {
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			return;
		}
		model.addAttribute("memberVO", memberVO);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		session.invalidate();	// 세션 파괴
		return "redirect:/main/home";
	}

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET() {
		
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public void joinPOST(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		String email_id = memberVO.getEmail_id();
		String result = memberService.overlapped(email_id);
		if(result != null) {
			String msg = "이미 가입된 이메일입니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("state", "join");
		}else {
			memberService.addMember(memberVO);
			response.sendRedirect(request.getContextPath() + "/main/home");
		}
	}
	
}
