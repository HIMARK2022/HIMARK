package com.himark.domain;

import java.util.Date;

import lombok.Data;
@Data
public class SysInfoVO {
	int adduser;
	int moduser;
	int deluser;
	int adddept;
	int moddept;
	int deldept;
	Date starttime;
	Date endtime;
}
