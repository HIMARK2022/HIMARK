package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;
import com.himark.mapper.ApproverTempSelectMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class ApproverTempSelectServiceImpl implements ApproverTempSelectService{
	@Setter(onMethod_=@Autowired)
	private ApproverTempSelectMapper mapper;

	@Override
	public List<UsersDetailVO> selectAbleMember(String dept_id) {
		return mapper.selectAbleMember(dept_id);
	}

	@Override
	public List<TempManagerInfoVO> findTempApprover(String manager_id) {
		return mapper.findTempApprover(manager_id);
	}
	
	

}
