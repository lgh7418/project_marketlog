package com.company.service;

import java.util.List;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderService {
	public void addOrder(OrderInfoVO orderInfoVO, OrderGoodsVO orderGoodsVO, int member_no, int address_no) throws Exception;
	public List<OrderInfoVO> getOrderInfo(int member_no) throws Exception;
	public List<OrderGoodsVO> getOrderGoods(int order_no) throws Exception;
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
}
