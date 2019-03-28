package com.company.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.company.domain.MemberVO;
import com.company.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject		// sqlSession template에서 지정
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.memberMapper";
	
/*	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		MemberVO memberVO = (MemberVO)sqlSession.selectOne(namespace + ".login", loginMap);
	    return memberVO;
	}*/
	
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


}
