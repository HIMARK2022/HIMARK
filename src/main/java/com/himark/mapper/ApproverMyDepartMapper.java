package com.himark.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ManagerVO;
import com.himark.domain.UsersDetailVO;

public interface ApproverMyDepartMapper {
	public List<UsersDetailVO> checkDuty(String user_id);
	public List<UsersDetailVO> findTeam(String user_id);
	public List<UsersDetailVO> findDepart(String user_id);
	public List<UsersDetailVO> findDTeam(String user_id);
	public List<UsersDetailVO> findAll();
	public List<UsersDetailVO> findHead(String user_id);
	public List<UsersDetailVO> findHDepart(String user_id);
	public List<UsersDetailVO> findHDTeam(String user_id);
	public List<ManagerVO> teamtemp(String user_id);
	
	public int insertTempNew(
			@Param("manager_id") String manager_id,
			@Param("approval_target") String approval_target,
			@Param("classify_target") String classify_target,
			@Param("approval_start") String approval_period,
			@Param("approval_finish") String approval_finish,
			@Param("temp_manager") String temp_manager
		);
	public int checkIn(String user_id);
	public int changeD(
			@Param("approval_start") String approval_start,
			@Param("approval_finish") String approval_finish,
			@Param("temp_manager") String temp_manager,
			@Param("manager_id") String manager_id
			);
	public int changeAcode(String user_id);
}
