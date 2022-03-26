package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.himark.domain.PaymentVO;
import com.himark.service.MemberService;
import com.himark.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({"/general/*","/approver/*"})
@AllArgsConstructor
public class PaymentController {

		private PaymentService pservice;
		private MemberService mservice;
		
		@PostMapping("/register")
		public String register(HttpServletRequest request,PaymentVO payment, RedirectAttributes rttr) {
			String userId = payment.getUserId();
			log.info(payment);
			pservice.register(payment);
			pservice.updateApprover(userId);
			log.info("요청번호 : " +payment.getRequestNo());
			pservice.updateFdate(payment.getRequestNo());
			
			//승인자
			if(mservice.getMember(userId).getAuthorityCode().equals("A2")) {
				log.info("승인자 register");
				return "redirect:/approver/request?userId="+userId; //redirect:를 하지 않는 경우, 새로고침시 도배
			}
			
			//일반 사용자
			//if(mservice.getMember(userId).getAuthorityCode().equals("A1")) {
			log.info("일반사용자 register");
			return "redirect:/general/request?userId="+userId; //redirect:를 하지 않는 경우, 새로고침시 도배
			
		}
		@GetMapping("/request")
		public void request( HttpServletRequest request,@RequestParam("userId") String userId,Model model,PaymentVO pvo) 
		{
			//승인자일경우
			if(mservice.getMember(userId).getAuthorityCode().equals("A2")) {
				log.info("승인자 요청목록 ");
				log.info(mservice.getMember(userId));
				log.info(pservice.getList(userId));
				
				model.addAttribute("member", mservice.getMember(userId));		
				
				if(pvo.getFilterList() == null || pvo.getFilterList().get(0).toString().equals("전체")) {
					model.addAttribute("list", pservice.getList(userId));

				}
				else {
				log.info("필터링");
				pvo.getFilterList().forEach(attach -> log.info(attach));
			
				log.info("사용자 : "+userId);
				pservice.getSearchList(pvo.getFilterList(),userId);
				model.addAttribute("filterList",pservice.getSearchList(pvo.getFilterList(),userId));
				model.addAttribute("flist",pvo.getFilterList());
				}
				
				
			}
			//일반사용자일경우
			if(mservice.getMember(userId).getAuthorityCode().equals("A1")) {
				log.info("일반사용자 요청목록 ");
				
				log.info(mservice.getMember(userId));
				log.info(pservice.getList(userId));
				
				model.addAttribute("member", mservice.getMember(userId));
				
				if(pvo.getFilterList() == null || pvo.getFilterList().get(0).toString().equals("전체")) {
					model.addAttribute("list", pservice.getList(userId));

				}
				else {
				log.info("필터링");
				pvo.getFilterList().forEach(attach -> log.info(attach));
			
				log.info("사용자 : "+userId);
				pservice.getSearchList(pvo.getFilterList(),userId);
				model.addAttribute("filterList",pservice.getSearchList(pvo.getFilterList(),userId));
				model.addAttribute("flist",pvo.getFilterList());
		
				}
				
			}
			
		
			
			//int requestNo = Integer.parseInt(request.getParameter("requestNo"));
			
//			Calendar cal = Calendar.getInstance();
//			String speriod = pservice.get(requestNo).getPeriod();
//			Date rdate = pservice.get(requestNo).getRdate();
//			int iperiod = Integer.parseInt(speriod.substring(0, speriod.indexOf("일")));
//			log.info(iperiod+"일");
//			cal.setTime(rdate);
//			cal.add(Calendar.DATE,iperiod);
//			pvo.setFdate(cal.getTime());
		
		}
		
		@PostMapping("/request")
		public String request( HttpServletRequest request, Model model,RedirectAttributes rttr) 
		{
					
			String userId = request.getParameter("userId");
			log.info(userId);
			log.info("요청목록2");
			PaymentVO pvo = new PaymentVO();
			
			log.info("fdate : "+request.getParameterValues("fdate"));
			String[] f_list = request.getParameterValues("filter");

			List<String> filterList = new ArrayList<String>();
			for(String f:f_list) {
				
				filterList.add(f);
				log.info("filterList : "+f);
			}
			
			pvo.setFilterList(filterList);
			pvo.setUserId(userId);
			//pvo.setFdate(date);
			
			pservice.getSearchList(filterList,userId);
			model.addAttribute("member", mservice.getMember(userId));
			rttr.addAttribute("filterList",filterList);
			
			
			if(mservice.getMember(userId).getAuthorityCode().equals("A2")) {
				return "redirect:/approver/request?userId="+userId;
			}
			return "redirect:/general/request?userId="+userId;
			
		}
		
		@GetMapping("/request_list")
		public void list(@RequestParam("userId") String userId, Model model,PaymentVO payment) {
			model.addAttribute("member", mservice.getMember(userId));
			log.info("목록 > 결재 승인 ");
			model.addAttribute("clist",pservice.getCompleteList(userId));
			log.info(pservice.getCompleteList(userId));
			log.info("목록 > 결재 반려 ");
			model.addAttribute("blist",pservice.getBackList(userId));
			log.info(pservice.getBackList(userId));
		}

		@GetMapping({"/request_detail","/payment_detail"})
		public void get(@RequestParam("requestNo") int requestNo, Model model,PaymentVO payment) 
		{
			log.info("get : "+ payment);
			String userId = payment.getUserId();
			log.info("userId : "+ userId);
			
			log.info("requestNo : "+ requestNo);
			model.addAttribute("member", mservice.getMember(userId));
			model.addAttribute("detail", pservice.get(requestNo));
		}
		
		
		@GetMapping("/payment")
		public void paymentList(@RequestParam("userId") String userId, Model model,PaymentVO payment) {
			log.info(pservice.getPaymentList(userId));
			log.info("승인자 > 결재 문서 ");
			model.addAttribute("rpayment",pservice.getPaymentList(userId));
			model.addAttribute("member", mservice.getMember(userId));
			
			log.info("승인자 > 결재 승인 ");
			model.addAttribute("cpayment",pservice.getCompletePaymentList(userId));
			
			log.info("승인자 > 결재 반려 ");
			model.addAttribute("bpayment",pservice.getBackPaymentList(userId));
			
		}
		
		@PostMapping("/payment")
		public String payment(HttpServletRequest request,PaymentVO payment, RedirectAttributes rttr) {
		
			String userId = payment.getUserId();
			log.info(payment);
			String state = request.getParameter("state");
			int requestNo = Integer.parseInt(request.getParameter("requestNo"));
			String rejectReason = request.getParameter("rejectReason");
			log.info("결재상태 : "+state);
			log.info("요청문서번호 : "+requestNo);
			log.info("반려이유 : "+rejectReason);
			pservice.updateReason(requestNo,rejectReason);
			pservice.updateState(requestNo,state);
			return "redirect:/approver/payment?userId="+userId;
			
		}
		
	}
