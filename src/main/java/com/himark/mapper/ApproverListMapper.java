package com.himark.mapper;

import java.util.List;

import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UserDetailVO;

public interface ApproverListMapper {
	public List<UserDetailVO> getTeamL(String user_id);
	public List<UserDetailVO> getDepartL(String user_id);
	public List<UserDetailVO> getUpperL(String user_id);

	public List<TempManagerInfoVO> tempManagerT(String dept_name);
	public List<TempManagerInfoVO> tempManagerD(String dept_name);
	public List<TempManagerInfoVO> tempManagerH(String dept_name);

	public List<UserDetailVO> searchAll();
}