package com.himark.service;

import java.util.List;

import com.himark.domain.MemberVO;

public interface MemberService {
	//회원정보 보기
	public MemberVO getMember(String userId);
	
	public MemberVO getApproverList(String managerId);		
		
	public List<MemberVO> getDeptList(String deptId);
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//승인자 출력
	public MemberVO getApprover(String userId);

	public MemberVO getCeo();

}
