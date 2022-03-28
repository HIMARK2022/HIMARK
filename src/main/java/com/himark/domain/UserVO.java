package com.himark.domain;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_password;
	private String user_name;

	private String pos_id;
	private String duty_id;
	private String dept_id;
	private String authority_code;
	private String birth_date;
	private String sex;
	
	
	private String phone_number;
	private String email;
	private String current_state;
}
