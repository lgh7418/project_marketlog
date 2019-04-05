package com.company.persistence;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.company.domain.MemberVO;
import com.company.domain.OrderInfoVO;
import com.company.dto.LoginDTO;

public interface MemberDAO {
	//public MemberVO login(Map loginMap) throws DataAccessException;
	public MemberVO login(LoginDTO loginDTO) throws Exception;
	public void insertNewMember(MemberVO memberVO) throws Exception;
	public String selectOverlappedID(String id) throws DataAccessException;
	public void updateInfo(OrderInfoVO orderInfoVO) throws Exception;
}
