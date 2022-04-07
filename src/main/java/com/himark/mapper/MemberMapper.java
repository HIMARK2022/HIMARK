package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.MemberVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;

public interface MemberMapper {
	public UsersDetailVO getMember(String userId);
	public MemberVO getApproverList(@Param ("managerId")String managerId);
	public List<MemberVO> getDeptList(@Param ("deptId") String deptId);
	public MemberVO login(MemberVO vo);
	public MemberVO getApprover(@Param ("userId") String userId);

	public UsersDetailVO getCeo();
	public TempManagerInfoVO getTempManager(@Param ("manager")String manager);
	public String getTempOrigin(String userId);


	public int countUser();

}
