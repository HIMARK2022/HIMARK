package com.himark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.ApproveListManageVO;

public interface ApproveListManageMapper {
	
	public int isInCheck(String classify_name);
	
	public int isInUpperCheck(String upper_classify_name);
	
	public boolean delList(String classify_name);
		
	public List<String> getUpperList();
	
	public void insertNewList(ApproveListManageVO amvo);
	
	public List<ApproveListManageVO> getCategory(String upper_classify_name);

	public boolean modList(@Param("mod_name")String mod_name, @Param("mod_period")String mod_period, @Param("amvo")ApproveListManageVO amvo);

	public boolean uppermodList(@Param("mod_name") String mod_name, @Param("amvo") ApproveListManageVO amvo);

}
