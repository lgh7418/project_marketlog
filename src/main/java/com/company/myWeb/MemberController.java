package com.company.myWeb;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.MemberVO;
import com.company.dto.LoginDTO;
import com.company.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	private MemberService memberService;
	
/*	@Inject
	private MemberVO memberVO;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map loginMap, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		if(memberVO != null && memberVO.getEmail_id() != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("isLogOn", true);	// 세션에 isLogOn이란 이름으로 바인딩해서 jsp에서 쓸 거임
	        session.setAttribute("memberInfo", memberVO);
	        
	        // 상품 주문 과정에서 로그인했으면 로그인 후 다시 주문 화면으로 진행
	        String action = (String) session.getAttribute("action");
	        if(action != null && action.equals("/order/address.do")) {
	            mav.setViewName("forward:"+action);
	        // 그 외에는 메인 페이지를 표시
	        }else {
	        	mav.setViewName("redirect:/main/home.do");
	     	}
	    }else {
	        String msg = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요";
	        mav.addObject("msg", msg);
	        mav.setViewName("/member/loginForm");
	    }
	    return mav;
	}*/
	

	
	
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
	/*   // 책 버전
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
			public ModelAndVie logout(req,res) {
	    ModelAndView mav = new ModelAndView();
	    HttpSession session = request.getSession();
	    session.setAttribuite("isLogOn", false);
	    session.removeAttribute("memberInfo");	// 세션에 바인딩했던 아이디, 비밀번호를 없앰
	    mav.setViewName("redirect:/main/home.do");
	    return mav;
	}
	 */
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET() {
		
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public void joinPOST(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		String contextPath = request.getContextPath();
		String email_id = memberVO.getEmail_id();
		String result = memberService.overlapped(email_id);
		if(result != null) {
			String msg = "이미 가입된 이메일입니다.";
			model.addAttribute("msg", msg);		// 이거 안먹음..ㅠㅠ
			response.sendRedirect(contextPath + "/member/join");
		}else {
			memberService.addMember(memberVO);
			response.sendRedirect(request.getContextPath() + "/main/home");
		}
	}
	
	
	
	
/*	public ResponseEntity joinPOST(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(memberVO);
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/login';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/join;";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}*/
	
/*	@RequestMapping(value="/overlapped.do", method = RequestMethod.POST)
	public String overlapped(@RequestParam("email_id") String email_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String result = memberService.overlapped(email_id);
		String msg = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		if(result != null) {
			msg = "<script>"
					+ "alert('이미 가입된 이메일입니다.')"
					+ "location.href='"+request.getContextPath()+"/member/join';"
					+ "</script>";
			resEntity =new ResponseEntity(msg, responseHeaders, HttpStatus.OK);
		}else {
			msg
		}
		return "redirect:/member/join";
	}*/
	
}
