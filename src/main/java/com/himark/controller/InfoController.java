package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j

@AllArgsConstructor
public class InfoController {
private MemberService mservice;
	
	
	@GetMapping({"/general/myinfo","/approver/myinfo"})
	public void get(@RequestParam("userName") String userName, Model model) 
	{
		log.info("/myinfo");
		log.info(userName);
		model.addAttribute("member", mservice.getMember(userName));
	}
}
