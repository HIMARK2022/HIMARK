package com.himark.mapper;

import java.util.List;

import com.himark.domain.SysInfoVO;

public interface AdminHomeMapper {

	public List<String> getbonbu();
	public List<String> getbuseo();
	public List<String> getteam();
	public SysInfoVO getsysinfo();
}
