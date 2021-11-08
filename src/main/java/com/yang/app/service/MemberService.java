package com.yang.app.service;

import com.yang.app.vo.MemberVO;

import java.util.List;

public interface MemberService {
	public boolean insertMember(MemberVO vo);
	public boolean updateMember(MemberVO vo);
	public void deleteMember(MemberVO vo);
	public List<MemberVO> getMemberList();
	public MemberVO getMember(MemberVO vo);
	public MemberVO getLoginMem(MemberVO vo);
	public boolean updateMpw(MemberVO vo);
}
