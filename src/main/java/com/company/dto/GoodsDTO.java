package com.company.dto;

import java.util.List;

public class GoodsDTO {
	private String goods_name;
	private String goods_price;
	private List<GoodsDTO> list;
	
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public List<GoodsDTO> getList() {
		return list;
	}
	public void setList(List<GoodsDTO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "GoodsDTO [goods_name=" + goods_name + ", goods_price=" + goods_price + ", list=" + list + "]";
	}
	
}
