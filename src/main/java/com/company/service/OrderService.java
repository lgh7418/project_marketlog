package com.company.service;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderService {
	public void addOrder(OrderInfoVO orderInfoVO, OrderGoodsVO orderGoodsVO, int member_no, int address_no) throws Exception;
}
