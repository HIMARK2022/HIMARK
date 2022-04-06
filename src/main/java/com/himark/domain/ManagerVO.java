package com.himark.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ManagerVO {

	private String manager_id;
	private String approval_target;
	private String classify_target;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approval_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approval_finish;
	private String temp_manager;
}
