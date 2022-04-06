package com.himark.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ManagerVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;

public interface AdminTempApproverService {
	
	public int selectTemp(
			@Param("approval_start") Date approval_start,
			@Param("approval_finish") Date approval_finish,
			@Param("temp_manager") String temp_manager,
			@Param("manager_id") String manager_id
			);
	
	public int updateTempAuthority(
			@Param("authority_code") String authority_code,
			@Param("user_id") String user_id
			);
	
	public List<TempManagerInfoVO> showTempInfo(String dept_id);
	
	public List<TempManagerInfoVO> showAllTemp();
	
	public int delTempManger(String temp_manager);
	
	public List<UsersDetailVO> selectAllTeamMemberTemp(String dept_id);
	
	public List<UsersDetailVO> selectNotTemp(String dept_id);
	
	public List<ManagerVO> IsInTemp(String temp_manager);

}
