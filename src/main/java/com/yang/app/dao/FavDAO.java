package com.yang.app.dao;

import com.yang.app.vo.FavVO;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository("fDAO")
public class FavDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private final static String namespace = "mappers.FavMapper";

    public void insertFav(FavVO vo) {
        this.sqlSession.insert(namespace + ".insertFav", vo);
    }

    public void deleteFav(FavVO vo) {
        this.sqlSession.delete(namespace + ".deleteFav", vo);
    }

    public List<FavVO> getFavList(FavVO vo) {
        return this.sqlSession.selectList(namespace + ".getFavList", vo);
    }

    public FavVO getFav(FavVO vo) {
        return this.sqlSession.selectOne(namespace + ".getFav", vo);
    }

    public boolean isFav(FavVO vo) {
        return (int) this.sqlSession.selectOne(namespace + ".isFav", vo) > 0;
    }

    public int getTotalCount(@Param("mid") final String mid) {
        return this.sqlSession.selectOne(namespace + ".getTotalCount", mid);
    }

    public List<FavVO> getPageList(String mid, int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("mid", mid);
        params.put("page", page);
        params.put("size", size);
        return this.sqlSession.selectList(namespace + ".getPageList", params);
    }

}
