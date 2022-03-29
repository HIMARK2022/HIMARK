package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.TempApprovalVO;
import com.himark.domain.TreeTeamVO;
import com.himark.domain.UserDetailVO;
import com.himark.domain.UserVO;
import com.himark.mapper.TreeTeamMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TreeTeamServiceImpl implements TreeTeamService{
	@Setter(onMethod_=@Autowired)
	private TreeTeamMapper mapper;
	@Override
	public List<TreeTeamVO> getHead() {
		return mapper.getHead();
	}
	@Override
	public List<TreeTeamVO> getDepart() {
		return mapper.getDepart();
	}
	@Override
	public List<TreeTeamVO> getPart() {
		return mapper.getPart();
	}
	@Override
	public List<TreeTeamVO> getTeam() {
		return mapper.getTeam();
	}
	@Override
	public List<UserDetailVO> getUserInfo(String name) {
		return mapper.getUserInfo(name);
	}
	@Override
	public void insertTemp(String user_id, String manager_id, String approval_start, String approval_finish) {
		mapper.insertTemp(user_id, manager_id, approval_start, approval_finish);
	}
	
	@Override
	public List<UserDetailVO> searchManager(String duty_id , String dept_name) {
		return mapper.searchManager(duty_id, dept_name);
	}
	@Override
	public List<TempApprovalVO> searchTemp() {
		
		return mapper.searchTemp();
	}
	@Override
	public String searchTemp_user(String user_id) {
		
		return mapper.searchTemp_user(user_id);
	}
	@Override
	public boolean updateTemp( String manager_id, String approval_start, String approval_finish ,String user_id) {
		boolean result = mapper.updateTemp(manager_id, approval_start, approval_finish,user_id) == true;
		return result;
	}
	@Override
	public List<UserDetailVO> searchUserById(String user_id) {
		return mapper.searchUserById(user_id);
	}
	@Override
	public List<UserVO> searchUpper(String duty_name, String duty_id) {
		return mapper.searchUpper(duty_name, duty_id);
	}
	@Override
	public void addTempManager(String manager_id, String user_id, String startdate, String enddate) {
		mapper.addTempManager(manager_id, user_id, startdate, enddate);
		
	}
	@Override
	public void changeAcode(String user_id) {
		mapper.changeAcode(user_id);
		
	}

}
