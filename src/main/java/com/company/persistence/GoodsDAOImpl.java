package com.company.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.goodsMapper";
	
	@Override
	public void insertGoods(GoodsVO goodsVO) throws Exception {
		sqlSession.insert(namespace + ".insertGoods", goodsVO);
	}

	@Override
	public List<GoodsVO> selectGoods(Integer address_no) throws Exception {
		return sqlSession.selectList(namespace + ".selectGoods", address_no);
	}

}
