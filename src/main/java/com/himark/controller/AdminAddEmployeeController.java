package com.himark.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.TreeInfoVO;
import com.himark.domain.UserVO;
import com.himark.domain.UsersDetailVO;
import com.himark.service.AdminAddEmployeeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminAddEmployeeController {
	
	private AdminAddEmployeeService service;
	
	@GetMapping("/add_employee")
	public void viewPage(Model model ) {
	     
		model.addAttribute("head",service.selectAllHead());
	     
		model.addAttribute("depart",service.selectHeadAndDepart());
	     
		model.addAttribute("team",service.selectDepartAndTeam());
	     
		model.addAttribute("duty",service.dutyInfo());
	     
		model.addAttribute("pos",service.posInfo()); 
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_head", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnHeadInfo(@RequestParam("head") String head) {
		log.info("본부 진입");
		
		return service.selectAllTeamMember(head);
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_depart", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnDepartInfo(@RequestParam("depart") String depart) {
		log.info("부서 진입");
		return service.selectAllTeamMember(depart);
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_team", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnTeamInfo(@RequestParam("team") String team) {
		log.info("팀 진입");
		return service.selectAllTeamMember(team);
	}
	
	@ResponseBody
	@PostMapping("/add_user")
	public UserVO add(Model model ,UserVO uservo) {
		
		log.info("직원 더하기 진입");
		
		ArrayList<Integer> IDS = new ArrayList<>();
 		for(int i=0;i<service.UserID().size();i++) {
			IDS.add(Integer.parseInt(service.UserID().get(i).getUser_id().toString()));
		}
 		int max=0;
 		max = Collections.max(IDS);
 		max = max + 1;
 		String id;
 		id = Integer.toString(max);
 		
 		service.AddUser(id,id,uservo.getUser_name()
 							,uservo.getPos_id()
 							,uservo.getDuty_id()
 							,uservo.getDept_id()
 							,uservo.getAuthority_code()
 							,uservo.getBirth_date()
 							,uservo.getSex()
 							,uservo.getPhone_number()
 							,uservo.getEmail()
 							,uservo.getCurrent_state());
 		
 		String manager_id = service.getApprover(uservo.getDept_id()).get(0).getUser_id().toString(); 
 		
 		service.insertManager(manager_id, id);  		
 		
		return uservo;
	}
	
	@ResponseBody
	@PostMapping("/mod_user")
	public UserVO mod(Model model ,UserVO uservo) {
		log.info("직원 수정 진입");
		service.modUser(uservo.getUser_name(), 
				uservo.getBirth_date(), 
				uservo.getSex(), 
				uservo.getEmail(), 
				uservo.getPhone_number(),
				uservo.getUser_id());
		return uservo;
	}
	 

}
