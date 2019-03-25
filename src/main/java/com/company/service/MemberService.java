package com.company.service;

import java.util.Map;

import com.company.domain.MemberVO;
import com.company.dto.LoginDTO;

public interface MemberService {
	//public MemberVO login(Map loginMap) throws Exception;
	public MemberVO login(LoginDTO loginDTO) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
}
