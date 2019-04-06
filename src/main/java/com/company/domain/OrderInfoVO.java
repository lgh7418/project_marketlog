package com.company.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class OrderInfoVO {
	private int order_no;
	private int member_no;
	private int address_no;
	private String recipient;
	private int postcode;
	private String address;
	private String detail_address;
	private int phone1;
	private int phone2;
	private int phone3;
	private String memo;
	private Timestamp order_time;
	private int shipping;
	private int order_status;
	private int addInfo;
	private int total_price;
	private List<OrderGoodsVO> list;
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Timestamp getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}
	public List<OrderGoodsVO> getList() {
		return list;
	}
	public void setList(List<OrderGoodsVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "OrderInfoVO [order_no=" + order_no + ", member_no=" + member_no + ", address_no=" + address_no
				+ ", recipient=" + recipient + ", postcode=" + postcode + ", address=" + address + ", detail_address="
				+ detail_address + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", memo=" + memo
				+ ", order_time=" + order_time + "]";
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public int getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(int addInfo) {
		this.addInfo = addInfo;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
}
