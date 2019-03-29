package com.company.myWeb;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.common.CommonUtils;
import com.company.domain.GoodsVO;
import com.company.persistence.AddressDAO;
import com.company.service.GoodsService;

@Controller
@RequestMapping("/buyer")
public class BuyerController {
	@Inject
	private AddressDAO addressDAO;
	
	@Inject
	private GoodsService goodsService;
	
	@RequestMapping(value="/*", method=RequestMethod.GET )
	public void page() {
		
	}
	
	@RequestMapping(value="/buyer_select", method=RequestMethod.POST)
	public void getAddress(String goods_address, Model model) throws Exception {
		goods_address = CommonUtils.changeAddress(goods_address);
		model.addAttribute("address", goods_address);
		
		Integer address_no = addressDAO.getAddressNo(goods_address);
		
		if(address_no != null) {
			List<GoodsVO> goodsList = goodsService.goodsList(address_no);
			System.out.println(goodsList);
			model.addAttribute("goodsList", goodsList);
		}

	}
}
