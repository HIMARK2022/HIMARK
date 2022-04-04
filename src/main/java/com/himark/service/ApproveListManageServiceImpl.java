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
	public List<String> getUpperList() {
	
		return mapper.getUpperList();
	}
	@Override
	public boolean delList(String classify_name) {
		
		return mapper.delList(classify_name);
	}
		/*
	 * @Override public boolean insertNewList( String classify_name, String
	 * approval_period) { return mapper.insertNewList( classify_name,
	 * approval_period); }
	 */
	
	@Override
	public int isInCheck(String classify_name) {
		int cnt = mapper.isInCheck(classify_name);
		return cnt;
	}
	
	@Override
	public int isInUpperCheck(String upper_classify_name) {
		int cnt = mapper.isInUpperCheck(upper_classify_name);
		return cnt;
	}
	
	@Override
	public void insertNewList(ApproveListManageVO amvo) {
		mapper.insertNewList( amvo);
		
	}
	
	@Override
	public List<ApproveListManageVO> getCategory(String upper_classify_name) {
		// TODO Auto-generated method stub
		return mapper.getCategory(upper_classify_name);
	}
	@Override
	public boolean modList(String mod_name, String mod_period, ApproveListManageVO amvo) {
		// TODO Auto-generated method stub
		return mapper.modList(mod_name, mod_period, amvo);
	}
	@Override
	public boolean uppermodList(String mod_name, ApproveListManageVO amvo) {
		// TODO Auto-generated method stub
		return mapper.uppermodList(mod_name,amvo);
	}

}
