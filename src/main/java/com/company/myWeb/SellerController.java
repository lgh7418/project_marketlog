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

import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;
import com.company.service.GoodsService;

@Controller
@RequestMapping("/seller")
public class SellerController {	
	@Inject
	private GoodsService goodsService;
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	
	@RequestMapping(value="/*", method=RequestMethod.GET )
	public void page() {
		
	}
	
	@RequestMapping(value="/seller_form", method=RequestMethod.POST)
	public void getAddress(@RequestParam("product_address") String address,
			Model model) throws Exception {
		if (address.indexOf("https://") != -1) {
			address = address.substring(8);
			address = "https://m." + address;
		}
		if (address.indexOf("http://") != -1) {
			address = address.substring(9);
			address = "https://m." + address;
		}
		model.addAttribute("address", address);
	}
	
	@RequestMapping(value="/seller_result", method=RequestMethod.POST)
	public void getProductInputs(GoodsDTO goodsDTO, AddressVO addressVO) throws Exception {
		//HttpSession session = request.getSession();
		// 주소 추가
		//String member_no = (String) session.getAttribute("member_no");
		//GoodsVO goodsVO = new GoodsVO();
		//goodsVO.set
		
		// 상품 추가
		
	}
	
}