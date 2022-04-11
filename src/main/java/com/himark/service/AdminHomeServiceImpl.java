package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.SysInfoVO;
import com.himark.mapper.AdminHomeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class AdminHomeServiceImpl implements AdminHomeService{
	@Setter(onMethod_=@Autowired)
	private AdminHomeMapper mapper;
	
	@Override
	public SysInfoVO getsysinfo() {
		// TODO Auto-generated method stub
		return mapper.getsysinfo();
	}

	@Override
	public int getWork() {
		// TODO Auto-generated method stub
		return mapper.getWork();
	}

	@Override
	public int getRetire() {
		// TODO Auto-generated method stub
		return mapper.getRetire();
	}
}
