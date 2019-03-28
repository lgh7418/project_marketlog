package com.company.domain;

//@Component("memberVO")
public class MemberVO {
	private String member_no;
	private String email_id;
	private String member_name;
	private String member_pw;
	private String joinDate;
	
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
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

