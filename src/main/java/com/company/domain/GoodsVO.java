package com.company.domain;

import java.util.List;

import org.springframework.stereotype.Component;

public class GoodsVO {
	private int goods_no;
	private String goods_name;
	private String goods_price;
	private int address_no;
	private int shipping;
	
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
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
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	@Override
	public String toString() {
		return "GoodsVO [goods_name=" + goods_name + ", goods_price=" + goods_price + ", address_no=" + address_no
				+ "]";
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}

	

}
