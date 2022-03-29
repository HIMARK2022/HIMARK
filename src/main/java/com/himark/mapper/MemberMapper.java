package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.MemberVO;

public interface MemberMapper {
	public MemberVO getMember(String userId);
	public List<MemberVO> getApproverList(@Param ("deptId")String deptId, @Param ("duty")String duty);
	public List<MemberVO> getDeptList(@Param ("deptId") String deptId);
	public MemberVO login(MemberVO vo);
}
