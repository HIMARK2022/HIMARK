package com.himark.mapper;

import org.apache.ibatis.annotations.Param;

public interface AdminSelectApproverMapper {
	
	public int updateAuthority(
			@Param("authority_code") String authority_code,
			@Param("user_id") String user_id
			);
}
