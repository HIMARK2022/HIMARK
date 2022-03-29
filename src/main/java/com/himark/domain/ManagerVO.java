package com.himark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ManagerVO {

	private String manager_id;
	private String approval_target;
	private String classify_target;
	private Date approval_start;
	private Date approval_finish;
	private String temp_manager;
}
