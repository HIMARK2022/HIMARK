package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.domain.MemberVO;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j

@AllArgsConstructor
public class InfoController {
private MemberService mservice;
	
	
	@GetMapping({"/general/myinfo","/approver/myinfo"})
	public void get(@RequestParam("userName") String userName, Model model) {
		log.info("/myinfo");
		log.info(userName);
		model.addAttribute("member", mservice.getMember(userName));
	}
	
	@GetMapping("/approver/approver_list")
	public void approverList(@RequestParam("userId") String userId, Model model, MemberVO member) {
		log.info("승인자리스트");
		log.info("userId : " + userId);
		String deptId = mservice.getMember(userId).getDeptId();
		String duty = mservice.getMember(userId).getDuty();
		log.info(mservice.getMember(userId).getDeptId());
		log.info("deptId : " + deptId);
		log.info("duty : " + duty);

		log.info(mservice.getMember(userId));
		log.info(mservice.getApproverList(deptId, duty));
		model.addAttribute("member", mservice.getMember(userId));
		model.addAttribute("alist", mservice.getApproverList(deptId, duty));

	}
}
