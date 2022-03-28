package com.himark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.himark.domain.MemberVO;
import com.himark.domain.PaymentVO;

import com.himark.mapper.PaymentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PaymentServiceImpl implements PaymentService {
	
	private PaymentMapper mapper;
	//private PaymentVO pvo;
	
	@Override
	public void register(PaymentVO payment) {

		log.info("register...."+payment);
		mapper.insert(payment);
		
	}

	@Override
	public List<PaymentVO> getList(String userId) {
		
		return mapper.getList(userId);
	}

	@Override
	public List<PaymentVO> getCompleteList(String userId) {
		log.info("목록 > 결재 완료 ");
		return mapper.getCompleteList(userId);
	}

	@Override
	public List<PaymentVO> getBackList(String userId) {
		log.info("목록 > 결재 반려 ");
		return mapper.getBackList(userId);
	}
	
	@Override
	public List<PaymentVO> getSearchList(@Param ("filterList") List<String> filterList,@Param ("userId") String userId) {
		log.info("filter...");
		return mapper.getSearchList(filterList,userId);

	}

	@Override
	public PaymentVO get(int requestNo) {
		
		return mapper.read(requestNo);
	}

	@Override
	public void updateApprover(String userId) {
		
		mapper.updateApprover(userId);
		
	}

	@Override
	public List<PaymentVO> getPaymentList(String userId) {
		log.info("승인자 > 결재 문서 ");
		return mapper.getPaymentList(userId);
	}

	@Override
	public List<PaymentVO> getCompletePaymentList(String userId) {
		log.info("승인자 > 결재 완료 ");
		return mapper.getCompletePaymentList(userId);
	}

	@Override
	public List<PaymentVO> getBackPaymentList(String userId) {
		log.info("승인자 > 결재 반려 ");
		return mapper.getBackPaymentList(userId);
	}

	@Override
	public void updateFdate(int requestNo,String imp) {
		mapper.updateFdate(requestNo,imp);
		
	}

	@Override
	public void updateState(int requestNo, String state) {
		
		mapper.updateState(requestNo,state);
		
	}

	@Override
	public void updateReason(int requestNo, String rejectReason) {
		mapper.updateReason(requestNo,rejectReason);
		
	}

	

	
}
