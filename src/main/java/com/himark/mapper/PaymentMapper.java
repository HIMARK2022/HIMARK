package com.himark.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.himark.domain.PaymentVO;

public interface PaymentMapper {
	public void insert(PaymentVO payment);

	public String deptId(String userName);

	public int total(PaymentVO payment);

	public List<PaymentVO> getList(String userId);
	
	public List<PaymentVO> getCompleteList(String userId);

	public List<PaymentVO> getBackList(String userId);
	
	public List<PaymentVO> getSearchList(@Param ("filterList") List<String> filterList, @Param ("userId") String userId);

	public PaymentVO read(int requestNo);
	
	public void updateApprover(String userId);
	
	public void updateFdate( @Param ("requestNo") int requestNo, @Param ("imp")String imp);

	public List<PaymentVO> getPaymentList(String userId);

	public List<PaymentVO> getCompletePaymentList(String userId);

	public List<PaymentVO> getBackPaymentList(String userId);

	public void updateState(@Param ("requestNo") int requestNo, @Param ("state") String state);

	public void updateReason(@Param ("requestNo") int requestNo, @Param ("rejectReason") String rejectReason);

	public List<String> getCategory();

	public String getTempManager(String userId);

}
