package com.company.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.company.domain.BoardVO;
import com.company.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardServiceTest {
	@Inject
	private BoardService bs;
	
	private static Logger logger = LoggerFactory.getLogger(BoardServiceTest.class);
	
	@Test
	public void testRegist() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로운 글의 제목입니다.");
		vo.setContent("글 내용입니다..그르글");
		vo.setWriter("honggildong");
		bs.regist(vo);
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(bs.read(3).toString());
	}
	
	@Test
	public void testGetList() throws Exception {
		List<BoardVO> voList  = new ArrayList<BoardVO>();
		voList = bs.listAll();
		
		for(BoardVO vo: voList) {
			logger.info(vo.toString());
		}
	}
	
	@Test
	public void testModify() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBno(3);
		vo.setTitle("수정된 제목입니다.");
		vo.setContent("수정된 제목입니다. 이 내용은 수정되었습니다.");
		bs.modify(vo);
	}
	@Test
	public void testDelete() throws Exception {
		bs.remove(3);
	}
}
