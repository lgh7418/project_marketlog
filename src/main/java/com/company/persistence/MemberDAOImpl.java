package com.company.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.company.domain.MemberVO;
import com.company.domain.OrderInfoVO;
import com.company.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject		// sqlSession template에서 지정
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.memberMapper";
	
	@Override
	public void insertNewMember(MemberVO memberVO) {
		sqlSession.insert(namespace+".insertNewMember", memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne(namespace + ".selectOverlappedID", id);
	    return result;
	}

	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".login", loginDTO);
	}

	@Override
	public void updateInfo(OrderInfoVO orderInfoVO) throws Exception {
		sqlSession.update(namespace+".updateInfo", orderInfoVO);
	}
	
	@Override
	public void updateInfo(MemberVO memberVO) throws Exception {
		sqlSession.update(namespace+".updateInfo", memberVO);
	}

	@Override
	public MemberVO selectMemberInfo(int member_no) throws Exception {
		return sqlSession.selectOne(namespace+".selectMemberInfo", member_no);
	}

}
