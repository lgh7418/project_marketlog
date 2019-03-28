package com.company.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.GoodsVO;
import com.company.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Inject
	private GoodsDAO goodsDAO;
	
	@Override
	public void addGoods(GoodsVO goodsVO) throws Exception {
		goodsDAO.insertGoods(goodsVO);
	}

}
