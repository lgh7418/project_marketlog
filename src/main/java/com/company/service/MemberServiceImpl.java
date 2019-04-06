package com.company.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.MemberVO;
import com.company.domain.OrderInfoVO;
import com.company.dto.LoginDTO;
import com.company.persistence.MemberDAO;

@Service
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public String overlapped(String id) throws Exception {
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		return memberDAO.login(loginDTO);
	}

	@Override
	public void updateInfo(OrderInfoVO orderInfoVO, int member_no) throws Exception {
		orderInfoVO.setMember_no(member_no);
		memberDAO.updateInfo(orderInfoVO);
	}
	
	@Override
	public void updateInfo(MemberVO memberVO, int member_no) throws Exception {
		memberVO.setMember_no(member_no);
		memberDAO.updateInfo(memberVO);
	}

	@Override
	public MemberVO selectMemberInfo(int member_no) throws Exception {
		return memberDAO.selectMemberInfo(member_no);
	}


}
