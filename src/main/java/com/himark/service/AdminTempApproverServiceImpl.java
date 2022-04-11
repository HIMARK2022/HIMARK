package com.himark.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.ManagerVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;
import com.himark.mapper.AdminTempApproverMapper;

import lombok.Setter;

@Service
public class AdminTempApproverServiceImpl implements AdminTempApproverService{
	
	@Setter(onMethod_=@Autowired)
	private AdminTempApproverMapper mapper;
	
	@Override
	public int selectTemp(Date approval_start, Date approval_finish, String temp_manager, String manager_id) {
		int cnt = mapper.selectTemp(approval_start, approval_finish, temp_manager, manager_id); 
		return cnt;
	}

	@Override
	public int updateTempAuthority(String authority_code, String user_id) {
		int cnt = mapper.updateTempAuthority(authority_code, user_id);
		return cnt;
	}

	@Override
	public List<TempManagerInfoVO> showTempInfo(String dept_id) {
		
		return mapper.showTempInfo(dept_id);
	}

	@Override
	public int delTempManger(String temp_manager) {
		int cnt = mapper.delTempManger(temp_manager);
		return cnt;
	}

	@Override
	public List<TempManagerInfoVO> showAllTemp() {
		
		return mapper.showAllTemp();
	}

	@Override
	public List<UsersDetailVO> selectAllTeamMemberTemp(String dept_id) {
	
		return mapper.selectAllTeamMemberTemp(dept_id);
	}

	@Override
	public List<UsersDetailVO> selectNotTemp(String dept_id) {
		
		return mapper.selectNotTemp(dept_id);
	}

	@Override
	public List<ManagerVO> IsInTemp(String temp_manager) {
		
		return mapper.IsInTemp(temp_manager);
		
	}

}
