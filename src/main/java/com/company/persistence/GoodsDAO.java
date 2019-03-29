package com.company.persistence;

import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;

public interface GoodsDAO {
	public void insertGoods(GoodsVO goodsVO) throws Exception;

}
