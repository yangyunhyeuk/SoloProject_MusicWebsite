package com.yang.app.service;

import com.yang.app.dao.BoardDAO;
import com.yang.app.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;

	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		bDAO.insertBoard(vo);
	}

	@Override
	public boolean updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return bDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		bDAO.deleteBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return bDAO.getBoardList();
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		try {
			return bDAO.getBoard(vo);
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int getTotalCount() {
		return bDAO.getTotalCount();
	}

	@Override
	public List<BoardVO> getPageList(int page, int size) {
		return bDAO.getPageList(page, size);
	}

}
