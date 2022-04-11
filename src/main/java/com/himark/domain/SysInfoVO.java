package com.himark.domain;

import java.util.Date;

import lombok.Data;
@Data
public class SysInfoVO {
	private int adduser;
	private int moduser;
	private int deluser;
	private int adddept;
	private int moddept;
	private int deldept;
	private Date starttime;
	private Date endtime;
}
