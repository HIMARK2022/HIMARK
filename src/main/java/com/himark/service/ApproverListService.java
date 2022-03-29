package com.himark.service;

import java.util.List;

import com.himark.domain.ManagerVO;
import com.himark.domain.UserDetailVO;
import com.himark.domain.UsersDetailVO;

public interface ApproverListService {
	public List<UserDetailVO> getTeamL(String user_id);
	public List<UserDetailVO> getDepartL(String user_id);
	public List<UserDetailVO> getUpperL(String user_id);

	public List<ManagerVO> findTemp(String user_id);
	public List<UsersDetailVO> searchAll(String user_id);
}