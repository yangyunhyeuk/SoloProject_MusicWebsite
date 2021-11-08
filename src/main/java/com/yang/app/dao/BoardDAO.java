package com.yang.app.dao;

import com.yang.app.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("bDAO")
public class BoardDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    private final static String namespace = "mappers.BoardMapper";

    public void insertBoard(BoardVO vo) {
        this.sqlSession.insert(namespace + ".insertBoard", vo);
    }

    public boolean updateBoard(BoardVO vo) {
        this.sqlSession.update(namespace + ".updateBoard", vo);
        return true;
    }

    public void deleteBoard(BoardVO vo) {
        this.sqlSession.delete(namespace + ".deleteBoard", vo);
    }

    public BoardVO getBoard(BoardVO vo) {
        return this.sqlSession.selectOne(namespace + ".getBoard", vo);
    }

    public List<BoardVO> getBoardList() {
        return this.sqlSession.selectList(namespace + ".getBoardList");
    }

    public int getTotalCount() {
        return this.sqlSession.selectOne(namespace + ".getTotalCount");
    }

    public List<BoardVO> getPageList(int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("page", page);
        params.put("size", size);
        return this.sqlSession.selectList(namespace + ".getPageList", params);
    }
}
