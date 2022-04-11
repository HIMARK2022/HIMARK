package com.himark.mapper;

import java.util.List;

import com.himark.domain.SysInfoVO;

public interface AdminHomeMapper {

	public SysInfoVO getsysinfo();
	
	public int getWork();
	public int getRetire();
}
