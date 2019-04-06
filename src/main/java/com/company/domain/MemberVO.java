package com.company.domain;

public class MemberVO {
	private int member_no;
	private String email_id;
	private String member_name;
	private String member_pw;
	private String joinDate;
	private int postcode;
	private String address;
	private String detail_address;
	private int phone1;
	private int phone2;
	private int phone3;
	
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
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [email_id=" + email_id + ", member_name="
				+ member_name + ", member_pw=" + member_pw + ", joinDate=" + joinDate + "]";
	}
	
}

