package com.company.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.orderMapper";

	@Override
	public int insertOrderInfo(OrderInfoVO orderInfoVO) throws Exception {
		sqlSession.insert(namespace+".insertOrderInfo", orderInfoVO);
		return orderInfoVO.getOrder_no();
	}
	
	@Override
	public void insertOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception {
		sqlSession.insert(namespace+".insertOrderGoods", orderGoodsVO);
	}

	@Override
	public List<OrderInfoVO> selectOrderInfo(int member_no) {
		return sqlSession.selectList(namespace+".selectOrderInfo", member_no);
	}

	@Override
	public List<OrderGoodsVO> selectOrderGoods(int order_no) {
		return sqlSession.selectList(namespace+".selectOrderGoods", order_no);
	}

	@Override
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception {
		sqlSession.update(namespace+".updateOrderInfo", orderInfoVO);
	}

	@Override
	public List<OrderInfoVO> selectOrderInfoList(int member_no) throws Exception {
		return sqlSession.selectList(namespace+".selectOrderInfoList", member_no);
	}
	
	
}
