package com.company.persistence;

import java.util.List;

import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;

public interface GoodsDAO {
	public void insertGoods(GoodsVO goodsVO) throws Exception;
	public List<GoodsVO> selectGoods(Integer address_no) throws Exception;
}
