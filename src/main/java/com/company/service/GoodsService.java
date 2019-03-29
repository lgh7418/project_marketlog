package com.company.service;

import java.util.List;

import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;

public interface GoodsService {
	public void addGoods(GoodsDTO goodsDTO, AddressVO addressVO) throws Exception;
	public List<GoodsVO> goodsList(Integer address_no) throws Exception;
}
