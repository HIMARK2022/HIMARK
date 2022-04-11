package com.himark.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.himark.domain.BoardAttachVO;
import com.himark.domain.PaymentVO;
import com.himark.mapper.BoardAttachMapper;
import com.himark.mapper.PaymentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	@Setter(onMethod_=@Autowired)
	private PaymentMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(PaymentVO payment) {

		log.info("register...."+payment);
		mapper.insert(payment);
		
		if(payment.getAttachList() == null || payment.getAttachList().size() <= 0) {
			return;
		}
		
		payment.getAttachList().forEach(attach ->{
			attach.setRno(payment.getRequestNo());
			attachMapper.insert(attach);
		});
		
	}
	@Override
	public void register(PaymentVO payment, int requestNo) {
		mapper.insert2(payment,requestNo);
		if(payment.getAttachList() == null || payment.getAttachList().size() <= 0) {
			return;
		}
		
		payment.getAttachList().forEach(attach ->{
			attach.setRno(payment.getRequestNo());
			attachMapper.insert(attach);
		});
		
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
	public void updateReason(int requestNo, String reason) {
		mapper.updateReason(requestNo,reason);
		
	}

	@Override
	public List<String> getUpperCategory() {
		// TODO Auto-generated method stub
		return mapper.getUpperCategory();
	}

	@Override
	public List<BoardAttachVO> getAttachList(int rno) {
		log.info("get Attach list by bno" + rno);
		return attachMapper.findByRno(rno);
	}

	@Override
	public String getTempManager(String userId) {
		// TODO Auto-generated method stub
		return mapper.getTempManager(userId);
	}
	@Override
	public List<String> getCategory() {
		// TODO Auto-generated method stub
		return mapper.getCategory();
	}
	@Override
	public List<String> getManager(int requestNo) {
		// TODO Auto-generated method stub
		return mapper.getManager(requestNo);
	}
	@Override
	public List<String> getUser(int requestNo) {
		// TODO Auto-generated method stub
		return mapper.getUser(requestNo);
	}

	

	

	
}
