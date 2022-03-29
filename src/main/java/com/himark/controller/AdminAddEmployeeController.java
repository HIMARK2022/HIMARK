package com.himark.controller;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void list(Model model) {
		log.info("직원추가");
		
		model.addAttribute("pos", service.posInfo());
		model.addAttribute("duty", service.dutyInfo());
		model.addAttribute("dept", service.deptInfo());
	}
	
	@PostMapping("/add_employee_All")
	public String add_basic(Model model,@RequestParam("user_name")String user_name
			,@RequestParam("year")String year,@RequestParam("month")String month,@RequestParam("day")String day
			,@RequestParam("phone")String phone,@RequestParam("email")String email ,@RequestParam("sex")String sex
			,@RequestParam("dept")String dept,@RequestParam("user_id")String user_id
			,@RequestParam("user_pwd")String user_pwd,@RequestParam("pos")String pos ,@RequestParam("duty")String duty) {
		log.info("정보추가");
		
		String birth = year +"-"+month+"-"+day;
		String AC = null;
		log.info(birth);
		if(duty.equals("d04")) {
			AC = "A2";
		}else if(duty.equals("d03")) {
			AC = "A1";
		}
		else if(duty.equals("d02")) {
			AC = "A1";
		}
		else if(duty.equals("d01")) {
			AC = "A1";
		}
		ArrayList<Integer> IDS = new ArrayList<>();
 		for(int i=0;i<service.UserID().size();i++) {
			IDS.add(Integer.parseInt(service.UserID().get(i).getUser_id().toString()));
		}
 		int max=0;
 		max = Collections.max(IDS);
 		max = max + 1;
 		String id;
 		id = Integer.toString(max);
		
		service.AddUser(id, id, user_name,pos ,duty, dept,AC,birth, sex, phone, email,"재직");
		return "redirect:/admin/add_employee";	
	}
	@PostMapping("/add_employee_com")
	public void add_com(Model model) {
		log.info("사내정보추가");
	}
}
