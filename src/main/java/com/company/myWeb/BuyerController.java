package com.company.myWeb;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
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
	
	private static final Logger logger = LoggerFactory.getLogger(BuyerController.class);
	
	@RequestMapping(value="/*", method=RequestMethod.GET )
	public void page() {
		
	}
	
	@RequestMapping(value="/buyer_select", method=RequestMethod.POST)
	public String getAddress(String goods_address, Model model, HttpSession session, HttpServletResponse res) throws Exception {
		//goods_address = CommonUtils.changeAddress(goods_address);
		System.out.println(goods_address);
		AddressVO addressVO = addressDAO.getAddressNo(goods_address);
		System.out.println(addressVO);
		model.addAttribute("address", goods_address);
		int address_no = addressVO.getAddress_no();
		if(address_no != 0) {
			List<GoodsVO> goodsList = goodsService.goodsList(address_no);
			model.addAttribute("goodsList", goodsList);
			model.addAttribute("shipping", addressVO.getShipping());
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
	public void addOderGoods(OrderGoodsVO vo) throws Exception {
		orderGoodsVO = vo;
	}
	
	@RequestMapping(value="/buyer_result", method=RequestMethod.POST)
	public void addOrderInfo(OrderInfoVO orderInfoVO, HttpSession session) throws Exception {
		int member_no = (int) session.getAttribute("member_no");
		int address_no = (int) session.getAttribute("address_no");
		orderService.addOrder(orderInfoVO, orderGoodsVO, member_no, address_no);
		session.removeAttribute("address_no");
	}
}
