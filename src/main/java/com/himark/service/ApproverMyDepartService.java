package com.himark.service;

import java.util.List;

import com.himark.domain.UsersDetailVO;

public interface ApproverMyDepartService {
	public List<UsersDetailVO> checkDuty(String user_id);
	public List<UsersDetailVO> findTeam(String user_id);
	public List<UsersDetailVO> findDepart(String user_id);
	public List<UsersDetailVO> findDTeam(String user_id);
	public List<UsersDetailVO> findAll();
	public List<UsersDetailVO> findHead(String user_id);
	public List<UsersDetailVO> findHDepart(String user_id);
	public List<UsersDetailVO> findHDTeam(String user_id);
	

}
