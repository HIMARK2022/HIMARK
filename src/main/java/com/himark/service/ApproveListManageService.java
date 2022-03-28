package com.himark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ApproveListManageVO;

public interface ApproveListManageService {
	public List<ApproveListManageVO> getAllList();
	public int isInCheck(String classify_name);
	public boolean delList(String classify_name);
	public boolean modList(
		@Param("mod_name") String mod_name,
		@Param("mod_period") String mod_period,
		@Param("org_name") String org_name,
		@Param("org_period") String org_period
	);
	public boolean insertNewList(
		@Param("classify_name") String classify_name,
		@Param("approval_period") String approval_period
	);
}
