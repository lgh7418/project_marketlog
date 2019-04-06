package com.company.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<OrderInfoVO> orderInfoList = orderDAO.selectOrderInfo(member_no);
		setOrderGoodsList(orderInfoList);
		return orderInfoList;
	}

	@Override
	public List<OrderGoodsVO> getOrderGoods(int order_no) throws Exception {
		return orderDAO.selectOrderGoods(order_no);
	}

	@Override
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception {
		orderDAO.updateOrderInfo(orderInfoVO);
	}

	@Override
	public List<OrderInfoVO> getSellerOrderInfo(int member_no, int order_status) throws Exception {
		Map<String, Integer> selector = new HashMap<String, Integer>();
		selector.put("member_no", member_no);
		selector.put("order_status", order_status);
		List<OrderInfoVO> sellerOrderInfoList = orderDAO.selectSellerOrderInfo(selector);
		setOrderGoodsList(sellerOrderInfoList);
		return sellerOrderInfoList;
	}

	// orderInfoList 각각의 orderInfo에 orderGoodsList 넣음
	public void setOrderGoodsList(List<OrderInfoVO> list) {
		for(OrderInfoVO vo : list) {
			int order_no = vo.getOrder_no();
			List<OrderGoodsVO> orderGoodsList = orderDAO.selectOrderGoods(order_no);
			vo.setList(orderGoodsList);
		}
	}

	@Override
	public void updateOrderStatus(int order_no, int order_status) throws Exception {
		Map<String, Integer> selector = new HashMap<String, Integer>();
		selector.put("order_no", order_no);
		selector.put("order_status", order_status);
		orderDAO.updateOrderStatus(selector);
	}

	@Override
	public void deleteOrder(OrderGoodsVO goods_name) throws Exception {
		for(OrderGoodsVO name: goods_name.getList()) {
			orderDAO.deleteOrder(name.getGoods_name());
			
		}
	}

}
