package com.himark.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TreePartVO {
	private String user_id;
	private Date birth_date;
	private String phone_number;
	private String email;
	private String sex;
	private String current_state; 
	private String name;
	private String pos;
	private String duty;
	private String part;
	private String part_id;
}
