package com.himark.mapper;

import java.util.List;

import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;

public interface ApproverTempSelectMapper {
	public List<UsersDetailVO> selectAbleMember(String dept_id);
	public TempManagerInfoVO findTempApprover(String manager_id);
}
