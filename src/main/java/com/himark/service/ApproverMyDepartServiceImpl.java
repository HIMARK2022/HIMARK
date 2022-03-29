package com.himark.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.ManagerVO;
import com.himark.domain.UsersDetailVO;
import com.himark.mapper.ApproverMyDepartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class ApproverMyDepartServiceImpl implements ApproverMyDepartService{
	@Setter(onMethod_=@Autowired)
	private ApproverMyDepartMapper mapper;
	@Override
	public List<UsersDetailVO> checkDuty(String user_id) {
		return mapper.checkDuty(user_id);
	}
	@Override
	public List<UsersDetailVO> findTeam(String user_id) {
		return mapper.findTeam(user_id);
	}
	@Override
	public List<UsersDetailVO> findDepart(String user_id) {
		return mapper.findDepart(user_id);
	}
	@Override
	public List<UsersDetailVO> findDTeam(String user_id) {
		return mapper.findDTeam(user_id);
	}
	@Override
	public List<UsersDetailVO> findAll() {
		return mapper.findAll();
	}
	@Override
	public List<UsersDetailVO> findHead(String user_id) {
		return mapper.findHead(user_id);
	}
	@Override
	public List<UsersDetailVO> findHDepart(String user_id) {
		return mapper.findHDepart(user_id);
	}
	@Override
	public List<UsersDetailVO> findHDTeam(String user_id) {
		return mapper.findHDTeam(user_id);
	}
	@Override
	public List<ManagerVO> teamtemp(String user_id) {
		return mapper.teamtemp(user_id);
	}
	@Override
	public int insertTempNew(String manager_id, String approval_target, String classify_target,
			String approval_period, String approval_finish, String temp_manager) {
		int cnt = mapper.insertTempNew(manager_id, approval_target, classify_target, approval_period, approval_finish, temp_manager);
		return cnt;
	}
	@Override
	public int checkIn(String user_id) {
		int cnt = mapper.checkIn(user_id);
		return cnt;
	}
	
	@Override
	public int changeAcode(String user_id) {
		int cnt = mapper.changeAcode(user_id);
		return cnt;
	}
	@Override
	public int changeD(String approval_start, String approval_finish, String temp_manager, String manager_id) {
		int cnt = mapper.changeD(approval_start, approval_finish, temp_manager, manager_id);
		return cnt;
	}
	

}
