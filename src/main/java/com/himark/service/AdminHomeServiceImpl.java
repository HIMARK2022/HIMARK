package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.mapper.AdminHomeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class AdminHomeServiceImpl implements AdminHomeService{
	@Setter(onMethod_=@Autowired)
	private AdminHomeMapper mapper;
	@Override
	public List<String> getbonbu() {
		// TODO Auto-generated method stub
		return mapper.getbonbu();
	}

	@Override
	public List<String> getbuseo() {
		// TODO Auto-generated method stub
		return mapper.getbuseo();
	}

	@Override
	public List<String> getteam() {
		// TODO Auto-generated method stub
		return mapper.getteam();
	}

}
