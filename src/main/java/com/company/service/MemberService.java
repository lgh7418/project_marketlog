package com.company.service;

import com.company.domain.MemberVO;
import com.company.domain.OrderInfoVO;
import com.company.dto.LoginDTO;

public interface MemberService {
	public MemberVO login(LoginDTO loginDTO) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public void updateInfo(OrderInfoVO orderInfoVO, int member_no) throws Exception;
	public void updateInfo(MemberVO memberVO, int member_no) throws Exception;
	public MemberVO selectMemberInfo(int member_no) throws Exception;
}
