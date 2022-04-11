package com.himark.service;

import java.util.List;

import com.himark.domain.SysInfoVO;

public interface AdminHomeService {

	public SysInfoVO getsysinfo();

	public int getWork();

	public int getRetire();
}
