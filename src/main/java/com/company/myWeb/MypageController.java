package com.company.myWeb;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;
import com.company.service.OrderService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Inject
	OrderService orderService;

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void buyer(HttpSession session, Model model) throws Exception {
		// id를 변수에 저장
		int member_no = (int) session.getAttribute("member_no");
		// id를 파라미터로 배송 정보를 받아옴
		List<OrderInfoVO> orderInfoList = orderService.getOrderInfo(member_no);
		model.addAttribute("orderInfoList", orderInfoList);
	}

	@RequestMapping(value="/modifyShipping", method=RequestMethod.POST)
	public void modifyShipping(OrderInfoVO orderInfoVO, Model model) throws Exception {
		model.addAttribute("orderInfo", orderInfoVO);
	}
	
	@RequestMapping(value="/modifyShipping.do", method=RequestMethod.POST)
	public void processShipping(OrderInfoVO orderInfoVO, HttpServletResponse res) throws Exception {
		orderService.updateOrderInfo(orderInfoVO);
		System.out.println(orderInfoVO);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.href='/mypage/mypage';</script>");
		out.flush();
	}
}
