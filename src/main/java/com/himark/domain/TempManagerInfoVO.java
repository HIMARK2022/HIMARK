package com.himark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TempManagerInfoVO {

	private String user_id;
	private String manager_id;
	private Date approval_start;
	private Date approval_finish;
	private String duty_id;
	private String duty_name;
	private String pos_name;
	private String dept_name;
	private String upper_dept;
	private String upper_dept2;
}