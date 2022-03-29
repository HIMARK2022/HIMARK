package com.himark.controller;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.service.TreeTeamService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminTreeTeamController {
	private TreeTeamService service;
	
	@GetMapping("/tree_employee")
	public void tree(Model model) {
		log.info("트리구조");
		model.addAttribute("head", service.getHead());
		log.info(service.getHead());
		model.addAttribute("depart", service.getDepart());
		model.addAttribute("part", service.getPart());
		model.addAttribute("team", service.getTeam());
		model.addAttribute("temp", service.searchTemp());
		
	}
	@PostMapping("/tree_employee")
	public void tree1(Model model , @RequestParam("username")String username ) {
		log.info("트리구조2");
		log.info(username);
		model.addAttribute("head", service.getHead());
		model.addAttribute("depart", service.getDepart());
		model.addAttribute("part", service.getPart());
		model.addAttribute("team", service.getTeam());
		model.addAttribute("userinfo", service.getUserInfo(username));
		model.addAttribute("temp", service.searchTemp());
		log.info(service.getUserInfo(username));
	}
	@PostMapping("/tree_employee_modal")
	public String modalinfo(Model model ,@RequestParam("selectBox")String selectBox , @RequestParam("user_id")String user_id , 
			@RequestParam("team_modal")String team,@RequestParam("depart_modal")String depart,@RequestParam("head_modal")String head,
			@RequestParam("authority")String authority,@RequestParam("start-date2")String startdate,@RequestParam("end-date2")String enddate) {
		log.info("모달");
		
		// ex) d05 10048 운영1팀 운영1팀 경영본부 사원
		String duty_id = selectBox; //부서 아이디 - 셀렉박스
		//user_id
		String duty_name = team;	//팀
		String head_name = head;	//본부
		String dept_name = authority; // 직급 이름
		//startdate					//시작일
		//enddate					//마감일
		
		log.info(service.searchUpper(duty_name, duty_id)); // 임시 승인자의 정보
		
		String manager_id = service.searchUpper(duty_name, duty_id).get(0).getUser_id();	// 매니저 아이디
		
		log.info(manager_id+ user_id+ startdate+ enddate);
		
		
		service.addTempManager(manager_id, user_id, startdate, enddate); // 임시 승인자를 매니저 테이블에 추가
		
		service.changeAcode(user_id); //임시 승인자의 권한 코드를 A2로 만듬
		
		return "redirect:/admin/tree_employee/";
	}
	
	@GetMapping("/modify_employee")
	public void treemodify(Model model ,@RequestParam("mod_id")String user_id )throws ParseException {
		log.info("수정하려는 사람의 아이디 : "+user_id); 
		model.addAttribute("User", service.searchUserById(user_id));
		log.info("수정하려는 사람의 정보 : "+service.searchUserById(user_id).get(0).getPos_name()); 
		log.info("이건뭐" + service.searchUserById(user_id).get(0).getUser_id().getClass().getSimpleName()); 
		log.info("이건뭐" + service.searchUserById(user_id).get(0).getPos_name().getClass().getSimpleName()); 
		log.info("이건뭐" + service.searchUserById(user_id).get(0).getUser_name().getClass().getSimpleName()); 
		log.info("이건뭐" + service.searchUserById(user_id).get(0).getBirth_date().getClass().getSimpleName()); 
	}
}
