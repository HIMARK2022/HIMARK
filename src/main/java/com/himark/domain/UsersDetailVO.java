package com.himark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UsersDetailVO {
	private String user_id;
	private String user_password;
	private String user_name;

	private String pos_id;
	private String duty_id;
	private String dept_id;
	
	private String birth_date;
	private String sex;
	private String phone_number;
	private String email;
	private String current_state;
	
	private String team;
	private String depart;
	private String head;
	
	private String pos_name;
	private String duty_name;
}
