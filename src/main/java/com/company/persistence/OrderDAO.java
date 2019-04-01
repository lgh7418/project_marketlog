package com.company.persistence;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderDAO {
	public int insertOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public void insertOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception;
}
