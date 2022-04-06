package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.ManagerVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;
import com.himark.service.AdminAddEmployeeService;
import com.himark.service.AdminTempApproverService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminTempApprover {

	private AdminAddEmployeeService AdminAddService;
	
	private AdminTempApproverService AdminTempService;
	
	@GetMapping("/Temp_Approver")
	public void viewPage(Model model ) {
	     
		model.addAttribute("head",AdminAddService.selectAllHead());
	     
		model.addAttribute("depart",AdminAddService.selectHeadAndDepart());
	     
		model.addAttribute("team",AdminAddService.selectDepartAndTeam());
	     
		model.addAttribute("duty",AdminAddService.dutyInfo());
	     
		model.addAttribute("pos",AdminAddService.posInfo()); 
		
	}
	
	@ResponseBody
	@PostMapping("/select_temp_approver")
	public ManagerVO select_temp(ManagerVO managervo) {
		
		AdminTempService.selectTemp(managervo.getApproval_start(), //매니저 테이블에 삽입한다.
									managervo.getApproval_finish(), 
									managervo.getTemp_manager(),
									managervo.getManager_id()); 
		
		String temp = managervo.getTemp_manager();
		
		int check =AdminTempService.IsInTemp(temp).size(); //임시 승인자 지정확인
		
		if(check ==1 ) {			
			log.info("이미 임시 승인자가 지정됨");
			String check_id =AdminTempService.IsInTemp(temp).get(0).getTemp_manager().toString(); //이미 있는 임시 승인자의 아이디
			
			log.info("이미있는 임시승인자 아이디"+check_id); 
			
			AdminTempService.updateTempAuthority("A2", temp); //새로 들어온 사람은 권한업데이트 
			
			AdminTempService.updateTempAuthority("A1", check_id);//이미 있던 임시승인자의 권한을 다시 되돌림
			
			
		
		}else {//임시 승인자 지정 안되있음.
			
			AdminTempService.updateTempAuthority("A2", temp); //권한을 업데이트하고 

		}
		
		return managervo;
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_temp", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<TempManagerInfoVO> returnTempInfo(@RequestParam("dept_id") String dept_id) {
		
		log.info("임시 승인자 확인");
		
		return AdminTempService.showTempInfo(dept_id);
	}
	
	
	@ResponseBody
	@PostMapping("/del_temp")
	public TempManagerInfoVO del_temp(TempManagerInfoVO tempmanagerinfovo) {
		
		log.info("임시 승인자 삭제");

		AdminTempService.delTempManger(tempmanagerinfovo.getTemp_manager());
		
		AdminTempService.updateTempAuthority("A1", tempmanagerinfovo.getTemp_manager());
		
		return tempmanagerinfovo;
	}
	
	@ResponseBody 
	@GetMapping(value = "/temp_head", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnHeadInfo(@RequestParam("head") String head) {
		log.info("본부 진입");
		
		if(AdminTempService.showAllTemp().size() == 0) {
			
			return AdminTempService.selectAllTeamMemberTemp(head);
		}
		else {
			
			return AdminTempService.selectNotTemp(head);
		}
		
		
	}
	
	@ResponseBody 
	@GetMapping(value = "/temp_depart", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnDepartInfo(@RequestParam("depart") String depart) {
		log.info("부서 진입");
		if(AdminTempService.showAllTemp().size() == 0) {
			
			return AdminTempService.selectAllTeamMemberTemp(depart);
		}
		else {
		
			return AdminTempService.selectNotTemp(depart);
		}
	}
	
	@ResponseBody 
	@GetMapping(value = "/temp_team", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnTeamInfo(@RequestParam("team") String team) {
		log.info("팀 진입");
		if(AdminTempService.showAllTemp().size() == 0) {
			
			return AdminTempService.selectAllTeamMemberTemp(team);
		}
		else {
		
			return AdminTempService.selectNotTemp(team);
		}
	}
	

}
