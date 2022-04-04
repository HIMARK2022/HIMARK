package com.himark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ApproveListManageVO;

public interface ApproveListManageService {
	
	public int isInCheck(String classify_name);
	
	public int isInUpperCheck(String upper_classify_name);
	
	public boolean delList(String classify_name);
	
	public List<String> getUpperList();

	public void insertNewList(ApproveListManageVO amvo);
	public List<ApproveListManageVO> getCategory(String upper_classify_name);

	public boolean modList(String mod_name, String mod_period, ApproveListManageVO amvo);

	public boolean uppermodList(String mod_name, ApproveListManageVO amvo);

}
