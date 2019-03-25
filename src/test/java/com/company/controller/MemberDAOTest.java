package com.company.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.MemberVO;
import com.company.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberDAOTest {
	
	@Inject private MemberDAO dao;
	
	@Test
	public void testInsertNewMember() throws Exception {
		MemberVO temp = new MemberVO();
		temp.setEmail_id("spring2@gmail.com");
		temp.setEmail1("spring1");
		temp.setEmail2("gmail.com");
		temp.setMember_name("홍길동2");
		temp.setMember_pw("12345");
		dao.insertNewMember(temp);
	}
}
