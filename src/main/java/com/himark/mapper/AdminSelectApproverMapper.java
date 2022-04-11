package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ManagerVO;
import com.himark.domain.UserVO;

public interface AdminSelectApproverMapper {
	
	public int updateAuthority(
			@Param("authority_code") String authority_code,
			@Param("user_id") String user_id
			);
	
	public List<UserVO> findOrgApprover(String dept_id);
	
	public List<ManagerVO> approvalTarget(String Manager_id);
	
	public int AddNewApprover(
			@Param("manager_id") String manager_id ,
			@Param("approval_target") String approval_target ,
			@Param("classify_target") String classify_target 
			);
	
	public int deleteApprover(String manager_id);
}
