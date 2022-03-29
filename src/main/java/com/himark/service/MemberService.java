package com.himark.service;

import java.util.List;

import com.himark.domain.MemberVO;

public interface MemberService {
	//회원정보 보기
	public MemberVO getMember(String userId);
	
	public List<MemberVO> getApproverList(String deptId, String duty);		
		
	public List<MemberVO> getDeptList(String deptId);
	
	//로그인
	public MemberVO login(MemberVO vo);

}
