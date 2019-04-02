package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.common.CommonUtils;
import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;
import com.company.persistence.OrderDAO;
@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO orderDAO;

	@Override
	public void addOrder(OrderInfoVO orderInfoVO, OrderGoodsVO orderGoodsVO, int member_no, int address_no) throws Exception {
		// 배송 정보를 넣고 order_no를 받아옴
		orderInfoVO.setMember_no(member_no);
		orderInfoVO.setAddress_no(address_no);
		int order_no = orderDAO.insertOrderInfo(orderInfoVO);
		
		// 주문 상품을 넣음
		List<OrderGoodsVO> orderGoodsList = orderGoodsVO.getList();
		for(OrderGoodsVO goods : orderGoodsList) {
			String name = goods.getGoods_name();
			if(CommonUtils.isEmpty(name)) {
				continue;
			}else {
				goods.setOrder_no(order_no);
				orderDAO.insertOrderGoods(goods);
			}
		}
	}

	@Override
	public List<OrderInfoVO> getOrderInfo(int member_no) throws Exception {
		return orderDAO.selectOrderInfo(member_no);
	}

	@Override
	public List<OrderGoodsVO> getOrderGoods(int order_no) throws Exception {
		return orderDAO.selectOrderGoods(order_no);
	}

}
