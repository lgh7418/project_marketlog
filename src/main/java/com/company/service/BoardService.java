package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;

public interface BoardService {

	// 글 등록
	public void regist(BoardVO vo) throws Exception;
	// 글 읽기
	public BoardVO read(int bno) throws Exception;
	// 글 수정
	public void modify(BoardVO vo) throws Exception;
	// 글 삭제
	public void remove(int bno) throws Exception;
	// 리스트로 보기
	public List<BoardVO> listAll() throws Exception;
}
