package com.himark.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.service.ApproverMyDepartService;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/approver/*")
@AllArgsConstructor
public class ApproverMyDepartController {
	private ApproverMyDepartService service;
	private MemberService mservice;
	
	@GetMapping("/myDepart")
	public void tree(Model model,@RequestParam("userId")String userId) {
		log.info("나의부서 승인자");
		log.info(userId);
		String duty = service.checkDuty(userId).get(0).getDuty_id().toString();
		log.info(duty);
		
		model.addAttribute("member", mservice.getMember(userId));
		
		
		if (duty.equals("d02")) {
			log.info("팀장");
			//log.info(service.findTeam(userId));
			model.addAttribute("team", service.findTeam(userId));
			
		}else if (duty.equals("d03")) {
			log.info("부서장");
			//log.info(service.findDepart(userId));
			
			model.addAttribute("depart", service.findDepart(userId));
			model.addAttribute("departT", service.findDTeam(userId));
			model.addAttribute("All", service.findAll());
			
		}else if (duty.equals("d04")) {
			log.info("본부장");
			//log.info(service.findHead(userId));
			model.addAttribute("head", service.findHead(userId));
			model.addAttribute("headD", service.findHDepart(userId));
			model.addAttribute("headDT", service.findHDTeam(userId));
			model.addAttribute("All", service.findAll());
			log.info(service.findHDepart(userId));
		} /*
			 * else if (duty.equals("d05")) { model.addAttribute("All", service.findAll());
			 * }
			 */
		
	}
	@PostMapping("/myDepart_team_temp")
	public String teamtemp(Model model,@RequestParam("user_id_team")String user_Id
			,@RequestParam("start-date2")String start,@RequestParam("end-date2")String end,@RequestParam("managerId") String managerId ) {
		String[] manager_id = managerId.split(",");
		
		ArrayList<String> listA = new ArrayList<String>();

		log.info(service.teamtemp(manager_id[0]).get(0).getApproval_target().toString());
		for(int i=0;i<service.teamtemp(manager_id[0]).size();i++) {			
			listA.add(service.teamtemp(manager_id[0]).get(i).getApproval_target().toString());
		}
		service.changeAcode(user_Id); // 임시승인자 코드 업데이트.
		log.info("있는지 확인 하기"+service.checkIn(manager_id[0]));
		log.info("있는지 확인 하기2 : : "+service.teamtemp(manager_id[0]).size());
		
		int c = service.checkIn(manager_id[0]);
		
		if(c==0) { //부여된 권한이 없으면 삽입
			for(int i=0; i<service.teamtemp(manager_id[0]).size() ;i++) {						
				service.insertTempNew(manager_id[0],listA.get(i) ,"T1" , start, end, user_Id);
			}
		}else if(c != 0){//있으면 업데이트
			log.info("업데이트");
			for(int i=0;i<service.teamtemp(manager_id[0]).size();i++) {						
				service.changeD(start, end, user_Id,manager_id[0]); //날짜 업데이트 
			}
		}

		return "redirect:/approver/myDepart?userId=" + manager_id[0];
	}
	
}
