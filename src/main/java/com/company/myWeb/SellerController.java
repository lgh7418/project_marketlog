package com.company.myWeb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/seller")
public class SellerController {	
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
	public void getProductInputs() {
		
	}
}