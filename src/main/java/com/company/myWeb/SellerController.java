package com.company.myWeb;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.common.CommonUtils;
import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;
import com.company.persistence.AddressDAO;
import com.company.service.GoodsService;

@Controller
@RequestMapping("/seller")
public class SellerController {	
	@Inject
	private GoodsService goodsService;
	
	@Inject
	private AddressDAO addressDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	
	@RequestMapping(value="/*", method=RequestMethod.GET )
	public void page() {
		
	}
	
	@RequestMapping(value="/seller_form", method=RequestMethod.POST)
	public String getAddress(String goods_address, Model model, HttpSession session) throws Exception {
		if (session.getAttribute("member_no") == null) {
			model.addAttribute("msg", "로그인하셔야합니다.");
			model.addAttribute("state", "login");
		}
		goods_address = CommonUtils.changeAddress(goods_address);
		Integer address_no = addressDAO.getAddressNo(goods_address);
		if(address_no != null) {
			String msg = "존재하는 페이지입니다.";
			model.addAttribute("msg", msg);
		}
		model.addAttribute("address", goods_address);
		return "seller/seller_form";
	}
	
	@RequestMapping(value="/seller_result", method=RequestMethod.POST)
	public void getProductInputs(GoodsDTO goodsDTO, AddressVO addressVO) throws Exception {
		// 주소 추가	
		addressDAO.insertAddress(addressVO);
		
		// 상품 추가
		goodsService.addGoods(goodsDTO, addressVO);
		
	}
	
}