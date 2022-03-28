package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.service.ApproverMyDepartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/approver/*")
@AllArgsConstructor
public class ApproverMyDepartController {
	private ApproverMyDepartService service;
	
	@GetMapping("/myDepart")
	public void tree(Model model,@RequestParam("userId")String userId) {
		log.info("나의부서 승인자");
		log.info(userId);
		String duty = service.checkDuty(userId).get(0).getDuty_id().toString();
		log.info(duty);
		if (duty.equals("d02")) {
			log.info("팀장");
			log.info(service.findTeam(userId));
			model.addAttribute("team", service.findTeam(userId));
			
		}else if (duty.equals("d03")) {
			log.info("부서장");
			log.info(service.findDepart(userId));
			
			model.addAttribute("depart", service.findDepart(userId));
			model.addAttribute("departT", service.findDTeam(userId));
			model.addAttribute("All", service.findAll());
			
		}else if (duty.equals("d04")) {
			log.info("본부장");
			log.info(service.findHead(userId));
			model.addAttribute("head", service.findHead(userId));
			model.addAttribute("headD", service.findHDepart(userId));
			model.addAttribute("headDT", service.findHDTeam(userId));
			model.addAttribute("All", service.findAll());
			log.info(service.findHDepart(userId));
		}else if (duty.equals("d05")) {
			
		}
	
	}
	@PostMapping("/myDepart_team_temp")
	public String teamtemp(Model model,@RequestParam("user_id_team")String userId
			,@RequestParam("start-date2")String start,@RequestParam("end-date2")String end) {
		
		log.info(userId);
		log.info(start);	
		log.info(end);
		
		return "redirect:approver/myDepart?userId=10020";
	}
}
