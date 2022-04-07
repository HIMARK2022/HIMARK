package com.himark.service;

import java.util.List;

import com.himark.domain.MemberVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;

public interface MemberService {
	//회원정보 보기
	public UsersDetailVO getMember(String userId);
	
	public MemberVO getApproverList(String managerId);		
		
	public List<MemberVO> getDeptList(String deptId);
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//승인자 출력
	public MemberVO getApprover(String userId);


	public UsersDetailVO getCeo();

	public TempManagerInfoVO getTempApprover(String manager);

	public String getTempOrigin(String userId);

	
	public int countUser();


}
