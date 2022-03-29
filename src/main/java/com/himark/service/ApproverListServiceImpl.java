package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.ManagerVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UserDetailVO;
import com.himark.domain.UsersDetailVO;
import com.himark.mapper.ApproverListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class ApproverListServiceImpl implements ApproverListService{
	@Setter(onMethod_=@Autowired)
	private ApproverListMapper mapper;
	@Override
	public List<UserDetailVO> getTeamL(String user_id) {
		return mapper.getTeamL(user_id);
	}

	@Override
	public List<UserDetailVO> getDepartL(String user_id) {
		return mapper.getDepartL(user_id);
	}

	@Override
	public List<UserDetailVO> getUpperL(String user_id) {
		return mapper.getUpperL(user_id);
	}

	@Override
	public List<ManagerVO> findTemp(String user_id) {
		
		return mapper.findTemp(user_id);
	}

	@Override
	public List<UsersDetailVO> searchAll(String user_id) {
		return mapper.searchAll(user_id);
	}



}