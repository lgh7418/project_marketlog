package com.company.domain;

import org.springframework.stereotype.Component;

//@Component("memberVO")
public class MemberVO {
	private String email_id;
	private String email1;
	private String email2;
	private String member_name;
	private String member_pw;
	private String joinDate;
	
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
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
		return "MemberVO [email_id=" + email_id + ", email1=" + email1 + ", email2=" + email2 + ", member_name="
				+ member_name + ", member_pw=" + member_pw + ", joinDate=" + joinDate + "]";
	}
	
}

