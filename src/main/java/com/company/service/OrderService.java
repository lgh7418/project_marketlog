package com.company.service;

import java.util.List;
import java.util.Map;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderService {
	public void addOrder(OrderInfoVO orderInfoVO, OrderGoodsVO orderGoodsVO, int member_no, int address_no) throws Exception;
	public List<OrderInfoVO> getOrderInfo(int member_no) throws Exception;
	public List<OrderGoodsVO> getOrderGoods(int order_no) throws Exception;
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public List<OrderInfoVO> getSellerOrderInfo(int member_no, int order_status) throws Exception;
	public void updateOrderStatus(int order_no, int order_status) throws Exception;
	public void deleteOrder(OrderGoodsVO goods_name) throws Exception;
	public void deleteOrderInfo(int order_no) throws Exception;
}
