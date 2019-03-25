package com.company.persistence;

import java.util.List;

import com.company.domain.BoardVO;

public interface BoardDAO {
	// 글 작성하기//
	public void create(BoardVO vo) throws Exception;
	// 글 읽어오기
	public BoardVO read(int bno) throws Exception;
	// 글 수정
	public void update(BoardVO vo) throws Exception;
	// 글 삭제
	public void delete(int bno) throws Exception;
	// 글 목록 가져오기
	public List<BoardVO> listAll() throws Exception;
}
