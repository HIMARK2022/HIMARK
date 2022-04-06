package com.himark.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TempManagerInfoVO {

	
	private String manager_id;
	private String manager_name;
	private String dept_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approval_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approval_finish;
	private String temp_manager;
	private String user_name;
	
}