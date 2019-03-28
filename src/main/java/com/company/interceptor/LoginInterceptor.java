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
	// preHandle: 해당 URL에 접근하기 전에 이루어짐
	// postHandle: 해당 URL에 접근 컨트롤러가 실행된 후에 이루어짐
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object Handler, ModelAndView mav) throws Exception {
		HttpSession session = req.getSession();
		ModelMap modelMap = mav.getModelMap();
		String contextPath = req.getContextPath();
		// 만약 모델맵에 memberVO가 들어가 있다면 로그인이 성공했다는 뜻
		MemberVO memberVO = (MemberVO) modelMap.get("memberVO");
		if(memberVO != null) {
			logger.info("로그인 성공");
			session.setAttribute("member_no", memberVO.getMember_no());	// 멤버 객체를 세션에 넣어줌
			res.sendRedirect(contextPath + "/main/home"); // 루트 폴더로 돌려보냄.
		}else {
			// 로그인 실패 시 다시 로그인 창으로 리다이렉트
			logger.info("로그인 실패");
			modelMap.addAttribute("msg", "아이디나 비밀번호가 올바르지 않습니다.");
		}
	}
}
