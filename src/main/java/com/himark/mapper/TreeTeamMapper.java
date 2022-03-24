package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.TempApprovalVO;
import com.himark.domain.TreeTeamVO;
import com.himark.domain.UserDetailVO;

public interface TreeTeamMapper {

	public List<TreeTeamVO> getHead();
	public List<TreeTeamVO> getDepart();
	public List<TreeTeamVO> getPart();
	public List<TreeTeamVO> getTeam();
	public List<UserDetailVO> getUserInfo(String name);
	public void insertTemp( 
			@Param("user_id") String user_id,
			@Param("manager_id") String manager_id,
			@Param("approval_start") String approval_start,
			@Param("approval_finish") String approval_finish);
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
}
