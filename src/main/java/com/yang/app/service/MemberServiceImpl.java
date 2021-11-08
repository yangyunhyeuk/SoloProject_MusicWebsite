package com.yang.app.service;

import com.yang.app.dao.MemberDAO;
import com.yang.app.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memDAO;

    @Override
    public boolean insertMember(MemberVO vo) {
        // TODO Auto-generated method stub
        try {
            memDAO.insertMember(vo);
            return true;
        } catch (Exception e) {
            System.out.println("에러 발생");
            return false;
        } finally {
            System.out.println("insertMember 예외 처리 중");
        }

    }

    @Override
    public boolean updateMember(MemberVO vo) {
        // TODO Auto-generated method stub
        try {
            memDAO.updateMember(vo);
            return true;
        } catch (Exception e) {
            System.out.println("에러 발생");
            return false;
        } finally {
            System.out.println("updateMember 예외 처리 중");
        }
    }

    @Override
    public void deleteMember(MemberVO vo) {
        // TODO Auto-generated method stub
        memDAO.deleteMember(vo);
    }

    @Override
    public List<MemberVO> getMemberList() {
        // TODO Auto-generated method stub
        return memDAO.getMemberList();
    }

    @Override
    public MemberVO getMember(MemberVO vo) {
        // TODO Auto-generated method stub
        try {
            return memDAO.getMember(vo);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public MemberVO getLoginMem(MemberVO vo) {
        // TODO Auto-generated method stub
        try {
            return memDAO.getLoginMem(vo);
        } catch (Exception e) {
            return null;
        } finally {
            System.out.println("getLoginMem 예외 처리 중");
        }
    }

    @Override
    public boolean updateMpw(MemberVO vo) {
        try {
            memDAO.updateMpw(vo);
            return true;
        } catch (Exception e) {
            System.out.println("에러 발생");
            return false;
        } finally {
            System.out.println("updateMpw 예외 처리 중");
        }
    }

}
