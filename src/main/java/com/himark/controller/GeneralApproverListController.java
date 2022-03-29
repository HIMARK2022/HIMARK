package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.domain.TempManagerInfoVO;
import com.himark.service.ApproverListService;
import com.himark.service.MemberService;
import com.himark.service.TreeTeamService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/general/*")
@AllArgsConstructor
public class GeneralApproverListController {
	private ApproverListService service;
	private TreeTeamService service2;
	private MemberService mservice;
	@GetMapping("/approver_list")
	public void tree(Model model , @RequestParam("userId")String userId) {
		model.addAttribute("member", mservice.getMember(userId));
		log.info("일반 사용자 승인자 리스트 ");
		model.addAttribute("team", service.getTeamL(userId));
		log.info("팀장...아이디"+service.getTeamL(userId).get(0).getUser_id().toString());
		String team = service.getTeamL(userId).get(0).getUser_id().toString();
		service.findTemp(team); //팀장이 부여한 임시 승인자 있는지 조회 
		log.info("팀장 부여 여부 "+service.findTemp(team));
		if(service.findTemp(team).size() !=  0) {
			String teamtemp =service.findTemp(team).get(0).getTemp_manager().toString(); //임시 승인자
			model.addAttribute("teamPer",service.findTemp(team));
			model.addAttribute("teamA", service.searchAll(teamtemp));			
		}

		
		
		model.addAttribute("depart", service.getDepartL(userId));
		log.info("부서장...아이디"+service.getDepartL(userId).get(0).getUser_id().toString());
		String depart = service.getDepartL(userId).get(0).getUser_id().toString();
		service.findTemp(depart);//부서장 부여한 임시 승인자 있는지 조회 
		log.info("부서 부여 여부 "+service.findTemp(depart).size());
		
		
		 if(service.findTemp(depart).size() !=  0) { 
			 String departtemp=service.findTemp(depart).get(0).getTemp_manager().toString(); //임시승인자 
			 log.info("부서 지정된것 있음");
			 model.addAttribute("departPer",service.findTemp(depart));
			 model.addAttribute("departA", service.searchAll(departtemp)); } else {
		 }
		
		 
	
		
		model.addAttribute("upper", service.getUpperL(userId));
		log.info("본부장...아이디"+service.getUpperL(userId).get(0).getUser_id().toString());
		String head = service.getUpperL(userId).get(0).getUser_id().toString();
		service.findTemp(head);//본부장 부여한 임시 승인자 있는지 조회
		log.info("본부 부여 여부 "+service.findTemp(head));
		if(service.findTemp(head).size() !=  0){
			String headtemp =service.findTemp(head).get(0).getTemp_manager().toString(); //임시 승인자
			model.addAttribute("headPer",service.findTemp(head));
			model.addAttribute("headA", service.searchAll(headtemp));	
		}
		
		
	}
}