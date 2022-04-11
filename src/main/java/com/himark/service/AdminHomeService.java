package com.himark.service;

import java.util.List;

import com.himark.domain.SysInfoVO;

public interface AdminHomeService {

	public List<String> getbonbu();
	public List<String> getbuseo();
	public List<String> getteam();
	public SysInfoVO getsysinfo();

}
