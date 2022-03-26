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
	@Override
	public boolean delList(String classify_name) {
		
		return mapper.delList(classify_name);
	}
	@Override
	public boolean modList(String mod_name, String mod_period, String org_name, String org_period) {
		return mapper.modList(mod_name, mod_period, org_name, org_period);
	}
	@Override
	public boolean insertNewList( String classify_name, String approval_period) {
		return mapper.insertNewList( classify_name, approval_period);
	}
	@Override
	public int isInCheck(String classify_name) {
		int cnt = mapper.isInCheck(classify_name);
		return cnt;
	}

}
