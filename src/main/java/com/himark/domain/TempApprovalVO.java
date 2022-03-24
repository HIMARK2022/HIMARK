package com.himark.domain;

import java.util.Date;


import lombok.Data;

@Data
public class TempApprovalVO {
	private String user_id;
	private String manager_id;
	private String approval_start;
	private String approval_finish;;
}