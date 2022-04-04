package com.himark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.mapper.AdminSelectApproverMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminSelectApproverServiceImpl implements AdminSelectApproverService{
	
	@Setter(onMethod_=@Autowired)
	private AdminSelectApproverMapper mapper;
	
	@Override
	public int updateAuthority(String authority_code, String user_id) {
		
		int cnt = mapper.updateAuthority(authority_code, user_id);
		
		return cnt;
	}

}
