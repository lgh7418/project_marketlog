package com.company.dto;

public class LoginDTO {
	private String email_id;
	private String member_pw;
	private boolean useAutoLogin;
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public boolean isUseAutoLogin() {
		return useAutoLogin;
	}
	public void setUseAutoLogin(boolean useAutoLogin) {
		this.useAutoLogin = useAutoLogin;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [email_id=" + email_id + ", member_pw=" + member_pw + ", useAutoLogin=" + useAutoLogin + "]";
	}
	
}
