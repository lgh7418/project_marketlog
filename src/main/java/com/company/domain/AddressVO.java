package com.company.domain;

public class AddressVO {
	private String goods_address;
	private int goods_price;
	private int member_no;
	public String getGoods_address() {
		return goods_address;
	}
	public void setGoods_address(String goods_address) {
		this.goods_address = goods_address;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	@Override
	public String toString() {
		return "AddressVO [goods_address=" + goods_address + ", goods_price=" + goods_price + ", member_no=" + member_no
				+ "]";
	}
	
}
