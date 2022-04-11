package com.himark.service;

import java.util.List;

import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;

public interface ApproverTempSelectService {
	public List<UsersDetailVO> selectAbleMember(String dept_id);
	
	public List<TempManagerInfoVO> findTempApprover(String manager_id);
}
