package com.company.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.goodsMapper";
	
	@Override
	public void insertGoods(GoodsVO goodsVO) throws Exception {
		sqlSession.insert(namespace + ".insertGoods", goodsVO);
	}

}
