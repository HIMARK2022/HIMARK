package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.DutyVO;
import com.himark.domain.PosVO;
import com.himark.domain.UserVO;
import com.himark.domain.deptVO;
import com.himark.mapper.AdminAddEmployeeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminAddEmployeeServiceImpl implements AdminAddEmployeeService{
	@Setter(onMethod_=@Autowired)
	private AdminAddEmployeeMapper mapper;
	public List<PosVO> posInfo() {
		
		return mapper.posInfo();
	}
	@Override
	public List<DutyVO> dutyInfo() {
		
		return mapper.dutyInfo();
	}
	
	@Override
	public List<deptVO> deptInfo() {
		return mapper.deptInfo();
	}
	@Override
	public int AddUser(String user_id, String user_password, String user_name, String pos_id, String duty_id,
			String dept_id, String authority_code, String birth_date, String sex, String phone_number, String email,
			String current_state) {
		int cnt = mapper.AddUser(user_id, user_password, user_name, pos_id, duty_id, dept_id, authority_code, birth_date, sex, phone_number, email, current_state);
		return cnt;
	}
	@Override
	public List<UserVO> UserID() {
		
		return mapper.UserID();
	}
	

	
}
