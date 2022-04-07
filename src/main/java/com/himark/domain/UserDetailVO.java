package com.himark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserDetailVO {

	private String user_id;
	private String user_password;
	private String user_name;

	private Date birth_date;
	private String sex;
	private String phone_number;

	private String email;
	private String current_state;
	private String pos_name;
	private String authority_code;

	private String duty_id;
	private String duty_name;
	private String dept_id;

	private String dept_name;
	private String upper_dept;
	private String upper_dept2;

}