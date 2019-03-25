package com.company.myWeb;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
/*	@RequestMapping(value="/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
	    ResponseEntity resEntity = null;
	    // ID 중복검사를 함
	    String result = memberService.overlapped(id);
	    resEntity = new ResponseEntity(result, HttpStatus.OK);
	    return resEntity;
	}
	*/
	
	
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
		return "redirect:/";
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
}
