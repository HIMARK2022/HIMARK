package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.ManagerVO;
import com.himark.domain.UserVO;
import com.himark.mapper.AdminSelectApproverMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminSelectApproverServiceImpl implements AdminSelectApproverService{
	
	@Setter(onMethod_=@Autowired)
	private AdminSelectApproverMapper mapper;
	
	@Override
	public int updateAuthority(String authority_code, String user_id) {
		
		int cnt = mapper.updateAuthority(authority_code, user_id);
		
		return cnt;
	}

	@Override
	public List<UserVO> findOrgApprover(String dept_id) {

		return mapper.findOrgApprover(dept_id);
	}

	@Override
	public List<ManagerVO> approvalTarget(String Manager_id) {
		
		return mapper.approvalTarget(Manager_id);
	}

	@Override
	public int AddNewApprover(String manager_id, String approval_target, String classify_target) {
		
		int cnt =mapper.AddNewApprover(manager_id, approval_target, classify_target);
		
		return cnt;
	}

	@Override
	public int deleteApprover(String manager_id) {
		
		int cnt = mapper.deleteApprover(manager_id);
		
		return cnt;
	}

}
