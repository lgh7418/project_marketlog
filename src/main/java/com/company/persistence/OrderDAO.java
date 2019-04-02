package com.company.persistence;

import java.util.HashMap;
import java.util.List;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderDAO {
	public int insertOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public void insertOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception;
	public List<OrderInfoVO> selectOrderInfo(int member_no);
	public List<OrderGoodsVO> selectOrderGoods(int order_no);
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public List<OrderInfoVO> selectOrderInfoList(int member_no) throws Exception;
}
