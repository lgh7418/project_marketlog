package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.common.CommonUtils;
import com.company.domain.AddressVO;
import com.company.domain.GoodsVO;
import com.company.dto.GoodsDTO;
import com.company.persistence.AddressDAO;
import com.company.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Inject
	private GoodsDAO goodsDAO;
	
	@Inject
	private AddressDAO addressDAO;
	
	@Override
	public int addGoods(GoodsDTO goodsDTO, AddressVO addressVO) throws Exception {
		Integer address_no = addressDAO.getAddressNo(addressVO.getGoods_address());
		List<GoodsDTO> goodsList = goodsDTO.getList();
		int i = 1;
		for (GoodsDTO goods : goodsList) {
			String name = goods.getGoods_name();
			if(CommonUtils.isEmpty(name)) {
				continue;
			}
			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoods_name(name);
			goodsVO.setGoods_price(goods.getGoods_price());
			goodsVO.setAddress_no(address_no);
			goodsVO.setGoods_no(i);
			i++;
			goodsDAO.insertGoods(goodsVO);			
		}
		return address_no;
	}

	@Override
	public List<GoodsVO> goodsList(Integer address_no) throws Exception {
		return goodsDAO.selectGoods(address_no);
	}

	@Override
	public void updateGoods(GoodsDTO goodsDTO, int address_no) throws Exception {
		goodsDAO.deleteGoods(address_no);
		List<GoodsDTO> goodsList = goodsDTO.getList();
		int i = 1;
		for (GoodsDTO goods : goodsList) {
			String name = goods.getGoods_name();
			if(CommonUtils.isEmpty(name)) {
				continue;
			}
			GoodsVO goodsVO = new GoodsVO();
			goodsVO.setGoods_name(name);
			goodsVO.setGoods_price(goods.getGoods_price());
			goodsVO.setAddress_no(address_no);
			goodsVO.setGoods_no(i);
			i++;
			goodsDAO.insertGoods(goodsVO);			
		}
	}
}
