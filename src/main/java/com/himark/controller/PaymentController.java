package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.himark.domain.BoardAttachVO;
import com.himark.domain.MemberVO;
import com.himark.domain.PaymentVO;
import com.himark.service.ApproverListService;
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
	private ApproverListService aservice;
	
	@PostMapping("/register")
	public String register(HttpServletRequest request,PaymentVO payment, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		log.info(userId);
		payment.setUserId(userId);
		log.info(payment);
		pservice.register(payment);
		//pservice.updateApprover(userId);
		int requestNo = payment.getRequestNo();
		
		/*
		 * String tempManager = pservice.getTempManager(userId);
		 * log.info("임시승인자 : "+tempManager); if(tempManager != null) {
		 * log.info("임시승인자 : "+tempManager); pservice.register(payment,requestNo);
		 * //pservice.updateApprover(userId); }
		 */
		
		log.info("요청번호 : "+requestNo );
		
		if(payment.getAttachList() != null) {
			payment.getAttachList().forEach(attach -> log.info(attach));
		}
		
		pservice.updateFdate(payment.getRequestNo(),payment.getImp());
		
		//승인자
		if(mservice.getMember(userId).getAuthorityCode().equals("A2")) {
			log.info("승인자 register");
			return "redirect:/approver/request_list?userId="+userId; //redirect:를 하지 않는 경우, 새로고침시 도배
		}
		
		//일반 사용자
		//if(mservice.getMember(userId).getAuthorityCode().equals("A1")) {
		log.info("일반사용자 register");
		return "redirect:/general/request_list?userId="+userId; //redirect:를 하지 않는 경우, 새로고침시 도배
		
	}


	@GetMapping("/request")
	public void request( HttpServletRequest request, Model model, PaymentVO pvo) 
	{
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		
		log.info(mservice.getMember(userId));
		log.info(pservice.getList(userId));

		model.addAttribute("uppercategory",pservice.getUpperCategory());
		model.addAttribute("category", pservice.getCategory());
		model.addAttribute("member", mservice.getMember(userId));
		
		// 승인자 리스트(승인자)
		String deptId = mservice.getMember(userId).getDeptId();
		String duty = mservice.getMember(userId).getDuty();
		log.info(mservice.getMember(userId).getDeptId());
		log.info("deptId : " + deptId);
		log.info("duty : " + duty);

		log.info(mservice.getMember(userId));
		log.info(mservice.getApproverList(deptId, duty));
		model.addAttribute("alist", mservice.getApproverList(deptId, duty));

		//  승인자 리스트(일반 사용자)
		model.addAttribute("team", aservice.getTeamL(userId));
		model.addAttribute("depart", aservice.getDepartL(userId));
		model.addAttribute("upper", aservice.getUpperL(userId));
		
		//승인자일경우
		if(mservice.getMember(userId).getAuthorityCode().equals("A2")) {
			log.info("승인자 요청목록 ");
					
		}
		//일반사용자일경우
		if(mservice.getMember(userId).getAuthorityCode().equals("A1")) {
			log.info("일반사용자 요청목록 ");
			
		}
		
	
		
		//int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		
//		Calendar cal = Calendar.getInstance();
//		String speriod = pservice.get(requestNo).getPeriod();
//		Date rdate = pservice.get(requestNo).getRdate();
//		int iperiod = Integer.parseInt(speriod.substring(0, speriod.indexOf("일")));
//		log.info(iperiod+"일");
//		cal.setTime(rdate);
//		cal.add(Calendar.DATE,iperiod);
//		pvo.setFdate(cal.getTime());
	
	}
	
	@PostMapping("/request")
	public String request( HttpServletRequest request, Model model,RedirectAttributes rttr) 
	{
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		
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
	public void list( Model model,PaymentVO pvo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		
		model.addAttribute("uppercategory",pservice.getUpperCategory());
		model.addAttribute("category", pservice.getCategory());
		model.addAttribute("member", mservice.getMember(userId));
		
		log.info("목록 > 결재 승인 ");
		model.addAttribute("clist",pservice.getCompleteList(userId));
		log.info(pservice.getCompleteList(userId));
		log.info("목록 > 결재 반려 ");
		model.addAttribute("blist",pservice.getBackList(userId));
		log.info(pservice.getBackList(userId));
		
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

	@GetMapping({"/request_detail","/payment_detail"})
	public void get(@RequestParam("requestNo") int requestNo, Model model,PaymentVO payment) 
	{
		log.info("get : "+ payment);
		String userId = payment.getUserId();
		log.info("userId : "+ userId);
		String requester = pservice.get(requestNo).getUserId();
		log.info("requester " +requester);
		log.info("requestNo : "+ requestNo);
		model.addAttribute("member", mservice.getMember(userId));
		model.addAttribute("detail", pservice.get(requestNo));

		model.addAttribute("user", mservice.getMember(requester));
		
		model.addAttribute("manager",pservice.getManager(requestNo) );
	}
	
	@ResponseBody 
	@GetMapping(value = "/getManager", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getManager(@RequestParam String requestNo) {
		
		int rno = Integer.parseInt(requestNo);

		return pservice.getManager(rno);
	}
	
	@ResponseBody 
	@GetMapping(value = "/getUser", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getUser(@RequestParam String requestNo) {

		int rno = Integer.parseInt(requestNo);
		log.info(pservice.getUser(rno));
		return pservice.getUser(rno);
	}
	
	
	@GetMapping("/payment")
	public void paymentList( Model model,PaymentVO payment,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		
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
	
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		log.info(payment);
		String state = request.getParameter("state");
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		String reason = request.getParameter("reason");
		log.info("결재상태 : "+state);
		log.info("요청문서번호 : "+requestNo);
		log.info("반려이유 : "+reason);
		pservice.updateReason(requestNo,reason);
		pservice.updateState(requestNo,state);
		
		return "redirect:/approver/payment?userId="+userId;
		
	}
	
	//게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환하도록 처리
		@GetMapping(value = "/getAttachList",
				produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>>getAttachList(int rno){
			log.info("getAttachList" + rno);
			return new ResponseEntity<>(pservice.getAttachList(rno), HttpStatus.OK);
		}
	
}
