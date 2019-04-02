package com.company.myWeb;

import java.util.List;

import javax.inject.Inject;
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
		// 주문번호를 파라미터로 상품 목록을 가져옴
		for(OrderInfoVO vo : orderInfoList) {
			int order_no = vo.getOrder_no();
			List<OrderGoodsVO> orderGoodsList = orderService.getOrderGoods(order_no);
			vo.setList(orderGoodsList);
		}
		model.addAttribute("orderInfoList", orderInfoList);
	}

	@RequestMapping(value="/modifyShipping", method=RequestMethod.POST)
	public void modifyShipping() throws Exception {
		
	}
}
