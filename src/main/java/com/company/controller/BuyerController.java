package com.company.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.common.CommonUtils;
import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;
import com.company.persistence.AddressDAO;
import com.company.service.GoodsService;
import com.company.service.MemberService;
import com.company.service.OrderService;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	@Inject
	private AddressDAO addressDAO;
	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private OrderGoodsVO orderGoodsVO;
	
	@Inject
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@RequestMapping(value="/*", method=RequestMethod.GET )
	public void page() {
		
	}
	
	@RequestMapping(value="/buyer_select", method=RequestMethod.POST)
	public String getAddress(String goods_address, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		goods_address = CommonUtils.changeAddress(goods_address);
		if (session.getAttribute("member_no") == null) {
			model.addAttribute("msg", "로그인하셔야합니다.");
			model.addAttribute("state", "login");
		}
		model.addAttribute("address", goods_address);
		Integer address_no = addressDAO.getAddressNo(goods_address);
		if(address_no != null) {
			List<GoodsVO> goodsList = goodsService.goodsList(address_no);
			model.addAttribute("goodsList", goodsList);
			session.setAttribute("address_no", address_no);
		}
		return "buyer/buyer_select";
	}
	
	@RequestMapping(value="/select/{address_no}", method=RequestMethod.GET)
	public String buyerSelect(@PathVariable("address_no") int address_no, Model model, HttpSession session) throws Exception {
		List<GoodsVO> goodsList = goodsService.goodsList(address_no);
		AddressVO addressVO = addressDAO.selectAddress(address_no);
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("shipping", addressVO.getShipping());
		model.addAttribute("address", addressVO.getGoods_address());
		session.setAttribute("address_no", address_no);
		return "/buyer/buyer_select";
	}
	
	
	@RequestMapping(value="/buyer_shipping", method=RequestMethod.POST)
	public void addOderGoods(OrderGoodsVO vo, int total_price, Model model) throws Exception {
		orderGoodsVO = vo;
		model.addAttribute("total_price", total_price);
	}
	
	@RequestMapping(value="/buyer_result", method=RequestMethod.POST)
	public void addOrderInfo(OrderInfoVO orderInfoVO, HttpSession session) throws Exception {
		Integer member_no = (Integer) session.getAttribute("member_no");
		int address_no = (int) session.getAttribute("address_no");
		if(member_no != null) {
			orderService.addOrder(orderInfoVO, orderGoodsVO, (int)member_no, address_no);
			if(orderInfoVO.getAddInfo() == 1) {
				memberService.updateInfo(orderInfoVO, (int)member_no);
			}
			session.removeAttribute("address_no");
		}
	}
}
