package com.company.domain;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class OrderGoodsVO {
	private int order_no;
	private String goods_name;
	private int goods_price;
	private int amount;
	private String memo;
	private List<OrderGoodsVO> list;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public List<OrderGoodsVO> getList() {
		return list;
	}
	public void setList(List<OrderGoodsVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "OrderGoodsVO [order_no=" + order_no + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", amount=" + amount + ", memo=" + memo + ", list=" + list + "]";
	}

}
