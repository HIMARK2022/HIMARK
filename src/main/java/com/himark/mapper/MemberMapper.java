package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.MemberVO;

public interface MemberMapper {
	public MemberVO getMember(String userId);
	public MemberVO getApproverList(@Param ("managerId")String managerId);
	public List<MemberVO> getDeptList(@Param ("deptId") String deptId);
	public MemberVO login(MemberVO vo);
	public MemberVO getApprover(@Param ("userId") String userId);
	public MemberVO getCeo();
	public int countUser();
}
