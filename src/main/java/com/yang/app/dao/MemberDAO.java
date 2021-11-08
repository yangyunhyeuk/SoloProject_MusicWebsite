package com.yang.app.dao;

import com.yang.app.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mDAO")
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    private final static String namespace = "mappers.MemberMapper";

    public void insertMember(MemberVO vo) {
        this.sqlSession.insert(namespace + ".insertMember", vo);
    }

    public void updateMember(MemberVO vo) {
        this.sqlSession.update(namespace + ".updateMember", vo);
    }

    public void updateMpw(MemberVO vo) {
        this.sqlSession.update(namespace + ".updateMpw", vo);
    }

    public void deleteMember(MemberVO vo) {
        this.sqlSession.delete(namespace + ".deleteMember", vo);
    }

    public MemberVO getMember(MemberVO vo) {
        return this.sqlSession.selectOne(namespace + ".getMember", vo);
    }

    public MemberVO getLoginMem(MemberVO vo) {
        return this.sqlSession.selectOne(namespace + ".getLoginMem", vo);
    }

    public List<MemberVO> getMemberList() {
        return this.sqlSession.selectList(namespace + ".getMemberList");
    }


}