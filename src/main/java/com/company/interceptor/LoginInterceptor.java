package com.company.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.company.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		HttpSession session = req.getSession();
		// 이미 로그인된 경우는 이전 로그인 데이터 클리어
		if(session.getAttribute("login")!=null) {
			logger.info("이전 로그인 정보를 삭제합니다.");
			session.removeAttribute("login");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object Handler, ModelAndView mav) throws Exception {
		HttpSession session = req.getSession();
		ModelMap modelMap = mav.getModelMap();
		String contextPath = req.getContextPath();
		MemberVO memberVO = (MemberVO) modelMap.get("memberVO");
		if(memberVO != null) {
			logger.info("로그인 성공");
			session.setAttribute("member_no", memberVO.getMember_no());
			res.sendRedirect(contextPath + "/");
		}else {
			logger.info("로그인 실패");
			modelMap.addAttribute("msg", "아이디나 비밀번호가 올바르지 않습니다.");
		}
	}
}
