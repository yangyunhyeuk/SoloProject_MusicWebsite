package com.yang.app.service;

import com.yang.app.vo.BoardVO;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	boolean updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	List<BoardVO> getBoardList();
	BoardVO getBoard(BoardVO vo);
	int getTotalCount();
	List<BoardVO> getPageList(int page, int size);

}
