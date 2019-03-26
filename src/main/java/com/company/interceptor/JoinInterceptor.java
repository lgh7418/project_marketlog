package com.company.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.company.service.MemberService;

public class JoinInterceptor extends HandlerInterceptorAdapter{
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String contextPath = request.getContextPath();
		String id = (String) session.getAttribute("email_id");
		String result = memberService.overlapped(id);
		if(result != null) {
			String msg = "존재하는 이메일입니다.";
			session.setAttribute("msg", msg);
			response.sendRedirect(contextPath + "member/join");
		}
		return true;
	}
}
