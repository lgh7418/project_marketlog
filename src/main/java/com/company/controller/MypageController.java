package com.company.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.domain.MemberVO;
import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;
import com.company.dto.GoodsDTO;
import com.company.persistence.AddressDAO;
import com.company.service.GoodsService;
import com.company.service.MemberService;
import com.company.service.OrderService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Inject
	OrderService orderService;
	
	@Inject
	AddressDAO addressDAO;
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value="/mypage/{num}", method=RequestMethod.GET)
	public String buyer(@PathVariable("num") int num, HttpSession session, Model model) throws Exception {
		// activate할 페이지
		model.addAttribute("num", num);
		int member_no = (int) session.getAttribute("member_no");
		// 구매 현황
		List<OrderInfoVO> orderInfoList = orderService.getOrderInfo(member_no);
		model.addAttribute("orderInfoList", orderInfoList);
		// 멤버 정보
		MemberVO memberVO = memberService.selectMemberInfo(member_no);
		model.addAttribute("member", memberVO);
		// 판매 현황
		List<OrderInfoVO> sellerOrderInfoList = orderService.getSellerOrderInfo(member_no, 0);
		model.addAttribute("sellerOrderInfoList", sellerOrderInfoList);
		List<OrderInfoVO> finishedOrderList = orderService.getSellerOrderInfo(member_no, 1);
		model.addAttribute("finishedOrderList", finishedOrderList);
		// 판매 정보
		List<AddressVO> addressList = addressDAO.selectAddressList(member_no);
		model.addAttribute("addressList", addressList);
		return "/mypage/mypage";
	}

	@RequestMapping(value="/modifyShipping", method=RequestMethod.POST)
	public void modifyShipping(OrderInfoVO orderInfoVO, Model model) throws Exception {
		model.addAttribute("orderInfo", orderInfoVO);
	}
	
	@RequestMapping(value="/modifyShipping.do", method=RequestMethod.POST)
	public void processShipping(OrderInfoVO orderInfoVO, HttpServletResponse res) throws Exception {
		orderService.updateOrderInfo(orderInfoVO);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.href='/mypage/mypage/4';</script>");
		out.flush();
	}
	
	@RequestMapping(value="/modifySellInfo/{address_no}", method=RequestMethod.GET)
	public String modifySellInfo(@PathVariable("address_no") int address_no, Model model) throws Exception {
		List<GoodsVO> goodsList = goodsService.goodsList(address_no);
		model.addAttribute("goodsList", goodsList);
		
		// 주소랑 배송비 받아오기
		AddressVO address = addressDAO.selectAddress(address_no);
		model.addAttribute("address", address);
		return "/mypage/modifySellInfo";
	}
	
	@RequestMapping(value="/modifySellInfo.do", method=RequestMethod.POST)
	public void processSellInfo(GoodsDTO goodsDTO, int address_no,
			HttpServletResponse res) throws Exception {
		goodsService.updateGoods(goodsDTO, address_no);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.href='/mypage/mypage/4';</script>");
		out.flush();
	}

	@RequestMapping(value="/sell/{order_no}/{order_status}")
	public String finishOrder(@PathVariable("order_no") int order_no, @PathVariable("order_status") int order_status) throws Exception {
		orderService.updateOrderStatus(order_no, order_status);
		return "redirect:/mypage/mypage/3";
	}
	
	@RequestMapping(value="/deleteOrder", method=RequestMethod.POST)
	public void deleteGoods(OrderGoodsVO goods_name, HttpServletResponse res) throws Exception {
		orderService.deleteOrder(goods_name);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('삭제되었습니다.'); location.href='/mypage/mypage/1';</script>");
		out.flush();
	}
	
	@RequestMapping(value="/memberInfo", method=RequestMethod.POST)
	public void memberInfo(MemberVO memberVO, HttpSession session, 
			HttpServletResponse res) throws Exception {
		int member_no = (int) session.getAttribute("member_no");
		memberService.updateInfo(memberVO, (int)member_no);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.href='/mypage/mypage/2';</script>");
		out.flush();
	}

}
