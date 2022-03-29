package com.himark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.TempApprovalVO;
import com.himark.domain.TreeTeamVO;
import com.himark.domain.UserDetailVO;
import com.himark.domain.UserVO;

public interface TreeTeamService {
	public List<TreeTeamVO> getHead();
	public List<TreeTeamVO> getDepart();
	public List<TreeTeamVO> getPart();
	public List<TreeTeamVO> getTeam();
	public List<UserDetailVO> getUserInfo(String name);
	public void insertTemp( 
			@Param("user_id") String user_id,
			@Param("manager_id") String manager_id,
			@Param("approval_start") String startdate,
			@Param("approval_finish") String enddate2);
	
	public List<TempApprovalVO> searchTemp();
	public String searchTemp_user(String user_id);
	public List<UserDetailVO>  searchManager( 
			@Param("duty_id") String duty_id , 
			@Param("dept_name")String dept_name);
	
	public boolean updateTemp(
			@Param("manager_id") String manager_id,
			@Param("approval_start") String approval_start,
			@Param("approval_finish") String approval_finish,
			@Param("user_id") String user_id
			); 
	public List<UserDetailVO> searchUserById (String user_id);
	public List<UserVO> searchUpper ( @Param("duty_name") String duty_name, @Param("duty_id") String duty_id);
	
	public void addTempManager(String manager_id, String user_id, String startdate, String enddate);
	public void changeAcode(String user_id);
}
