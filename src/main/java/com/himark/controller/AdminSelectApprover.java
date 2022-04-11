package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.ManagerVO;
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
		
		String dept_id = uservo.getDept_id();
		
		String user_id = uservo.getUser_id();
		
		String manager_id = SelectApproverService.findOrgApprover(dept_id).get(0).getUser_id().toString();
		//선택한 사용자가 속한 부서의 승인자(인사연동으로 들어온 원 승인자)
		
		
		List<ManagerVO> targets = SelectApproverService.approvalTarget(manager_id);
		
		log.info(targets);
		for(int i=0;i<targets.size();i++) {
			
			SelectApproverService.AddNewApprover(user_id, 
					targets.get(i).getApproval_target().toString(), 
					targets.get(i).getClassify_target().toString());
			
		}//승인타겟을 최초 승인자와 같이한다.
		
		SelectApproverService.updateAuthority("A2", uservo.getUser_id());
		
		return uservo;
	}
	
	@ResponseBody
	@PostMapping("/delete_authority")
	public UserVO del(Model model ,UserVO uservo) {
		
		SelectApproverService.updateAuthority("A1", uservo.getUser_id());
		
		SelectApproverService.deleteApprover(uservo.getUser_id());
		
		return uservo;
	}
}
