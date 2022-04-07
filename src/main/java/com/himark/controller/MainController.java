package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.himark.domain.MemberVO;
import com.himark.service.AdminHomeService;
import com.himark.service.ApproverListService;
import com.himark.service.MemberService;
import com.himark.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping({"/general/*","/approver/*","/*"})
public class MainController {
	private MemberService mservice;
	private AdminHomeService aservice;
	private PaymentService pservice;
	private ApproverListService service; // 승인자 목록
	@GetMapping({"/home", "/mydept"})
	public void home(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		model.addAttribute("progress",pservice.getList(userId).size());
		model.addAttribute("complete",pservice.getCompleteList(userId).size());
		model.addAttribute("back",pservice.getBackList(userId).size());
		model.addAttribute("member", mservice.getMember(userId));
		log.info(mservice.getMember(userId));
		
		//임시승인자일 경우
		String tempOriginId = mservice.getTempOrigin(userId);
		model.addAttribute("tempOrigin", tempOriginId);
		if(tempOriginId != null) {
			userId=tempOriginId;
		}
		
		model.addAttribute("member", mservice.getMember(userId));
		String deptId = mservice.getMember(userId).getDept_id();
		model.addAttribute("dlist", mservice.getDeptList(deptId));
		log.info(mservice.getDeptList(deptId));
		

		
		model.addAttribute("gprogress",pservice.getPaymentList(userId).size());
		model.addAttribute("gcomplete",pservice.getCompletePaymentList(userId).size());
		model.addAttribute("gback",pservice.getBackPaymentList(userId).size());
		// 승인자 목록
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		
		if(mservice.getApprover(userId) == null) {
			model.addAttribute("ceo", mservice.getCeo());
		}else {
			String managerId = mservice.getApprover(userId).getUserId();
		boolean tf=true;
	
		while(tf==true) {
			if(mservice.getApprover(managerId) != null) {
				System.out.println(managerId);
				mservice.getApproverList(managerId);
				list.add(mservice.getApproverList(managerId));
				managerId = mservice.getApprover(managerId).getUserId();
				
			}
			else {
				list.add(mservice.getApproverList(managerId));
				tf = false;
			}	
		}
		
		log.info("=================list.size() 출력: "+list.size());	
		for(MemberVO L : list) {
			System.out.println(L);
		}

		model.addAttribute("alist", list);
		model.addAttribute("ceo", mservice.getCeo());
		
		}
	}
	@GetMapping("/admin/home")
	public void adminHome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
		model.addAttribute("member", mservice.getMember(userId));
		
		model.addAttribute("bonbu",  aservice.getbonbu());
		model.addAttribute("buseo",aservice.getbuseo());
		model.addAttribute("team",aservice.getteam());
		log.info( aservice.getbonbu());
		log.info( aservice.getbuseo());
		log.info( aservice.getteam());

	}
	
	
}
