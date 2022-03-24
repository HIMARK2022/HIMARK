package com.himark.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
	private int requestNo;
	private String userName;
	private String userId;
	private String managerId;
	private String title;
	private String category;
	private String classifyNo;
	private String imp;
	private String file;
	private String content;
	private String period;
	private Date rdate;
	private Date fdate;
	private Date cdate;
	private String state;
	private String rejectReason;
	
	private List<String> filterList;
	
	
}