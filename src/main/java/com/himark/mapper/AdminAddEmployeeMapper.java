package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.DutyVO;
import com.himark.domain.PosVO;
import com.himark.domain.UserVO;
import com.himark.domain.deptVO;

public interface AdminAddEmployeeMapper {
	public List<PosVO> posInfo();
	public List<DutyVO> dutyInfo();
	public List<deptVO> deptInfo();
	public List<UserVO> UserID();
	public int AddUser(
			@Param("user_id") String user_id,
			@Param("user_password") String user_password,
			@Param("user_name") String user_name,
			@Param("pos_id") String pos_id,
			@Param("duty_id") String duty_id,
			@Param("dept_id") String dept_id,
			@Param("authority_code") String authority_code,
			@Param("birth_date") String birth_date, 
			@Param("sex") String sex,
			@Param("phone_number") String phone_number,
			@Param("email") String email, 
			@Param("current_state") String current_state 
			);
}
