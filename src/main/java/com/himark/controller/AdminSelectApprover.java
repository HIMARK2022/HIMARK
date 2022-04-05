package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.UserVO;
import com.himark.service.AdminAddEmployeeService;
import com.himark.service.AdminSelectApproverService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminSelectApprover {
	
	private AdminAddEmployeeService AddService;
	
	private AdminSelectApproverService SelectApproverService;
	
	@GetMapping("/Select_Approver")
	public void viewPage(Model model ) {
	     
		model.addAttribute("head",AddService.selectAllHead());
	    
		model.addAttribute("depart",AddService.selectHeadAndDepart());
	    
		model.addAttribute("team",AddService.selectDepartAndTeam());
	    
		model.addAttribute("duty",AddService.dutyInfo());
	    
		model.addAttribute("pos",AddService.posInfo()); 
	}
	
	@ResponseBody
	@PostMapping("/update_authority")
	public UserVO mod(Model model ,UserVO uservo) {
		
		SelectApproverService.updateAuthority("A2", uservo.getUser_id());
		
		return uservo;
	}
	
	@ResponseBody
	@PostMapping("/delete_authority")
	public UserVO del(Model model ,UserVO uservo) {
		
		SelectApproverService.updateAuthority("A1", uservo.getUser_id());
		
		return uservo;
	}
}
