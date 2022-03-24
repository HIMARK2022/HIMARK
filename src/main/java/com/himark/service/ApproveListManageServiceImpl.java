package com.himark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.himark.domain.ApproveListManageVO;
import com.himark.mapper.ApproveListManageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ApproveListManageServiceImpl implements ApproveListManageService{
	@Setter(onMethod_=@Autowired)
	private ApproveListManageMapper mapper;
	@Override
	public List<ApproveListManageVO> getAllList() {
	
		return mapper.getAllList();
	}

}
