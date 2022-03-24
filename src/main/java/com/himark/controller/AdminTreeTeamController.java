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
			@RequestParam("authority")String authority,@RequestParam("start-date2")String startdate2,@RequestParam("end-date2")String enddate2) {
		log.info("모달");
		
		log.info(selectBox+" "+user_id+" "+ team+" "+depart+" "+head+" "+authority+" "+startdate2+" "+enddate2);
	
		if(selectBox != "none" ) {
			if(selectBox.equals("d05")) {
				log.info("대표 권한 부여");
			}else if(selectBox.equals("d04")) {
				log.info("본부장 권한 부여");
				if(service.searchTemp_user(user_id) == null) {
					log.info("이전에 부여된 권한이 없음");
					log.info(service.searchManager(selectBox, head));
					log.info(service.searchManager(selectBox, head).get(0));
					String s = service.searchManager(selectBox, head).get(0).getUser_id().toString();
					
					service.insertTemp(user_id,s,startdate2,enddate2);	
					
				}else {
					log.info("이전에 부여된 권한이 있음.");
					String s = service.searchManager(selectBox, head).get(0).getUser_id().toString();
					service.updateTemp(s, startdate2, enddate2,user_id);
					log.info(service.updateTemp(s, startdate2, enddate2,user_id));
				}
			}
			else if(selectBox.equals("d03")) {
				log.info("부서장 권한 부여");
				if(service.searchTemp_user(user_id) == null) {
					log.info("이전에 부여된 권한이 없음");
					String s = service.searchManager(selectBox, depart).get(0).getUser_id().toString();
					log.info(s);
					service.insertTemp(user_id,s,startdate2,enddate2);
				}else {
					log.info("이전에 부여된 권한이 있음.");
					String s = service.searchManager(selectBox, depart).get(0).getUser_id().toString();
					
					log.info("권한 업데이트 "+s);
					service.updateTemp(s, startdate2, enddate2,user_id);
				}
				
			}
			else if(selectBox.equals("d02")) {
				log.info("팀장 권한 부여");
				if(service.searchTemp_user(user_id) == null) {
					log.info("이전에 부여된 권한이 없음");
					String s = service.searchManager(selectBox, team).get(0).getUser_id().toString();
					service.insertTemp(user_id,s,startdate2,enddate2);
				}else {
					log.info("이전에 부여된 권한이 있음.");
					String s = service.searchManager(selectBox, team).get(0).getUser_id().toString();
					log.info("권한 업데이트 "+s);
					service.updateTemp(s, startdate2, enddate2,user_id);
				}
			}
		}

		return "redirect:/admin/tree_employee";
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
