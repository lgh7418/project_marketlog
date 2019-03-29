package com.company.service;

import com.company.domain.AddressVO;
import com.company.dto.GoodsDTO;

public interface GoodsService {
	public void addGoods(GoodsDTO goodsDTO, AddressVO addressVO) throws Exception;
}
