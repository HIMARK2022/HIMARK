package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.ManagerVO;
import com.himark.domain.MemberVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UserVO;
import com.himark.domain.UsersDetailVO;
import com.himark.service.AdminTempApproverService;
import com.himark.service.ApproverTempSelectService;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/approver/*")
@AllArgsConstructor
public class ApproverTempSelectController {
	
	private ApproverTempSelectService  tempselectservice;
	
	private MemberService mservice;
	
	private AdminTempApproverService AdminTempService;
	
	@GetMapping("/TempSelect")
	public void tree(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginUser");
		String userId= m.getUserId();
	
			
		model.addAttribute("temp",tempselectservice.findTempApprover(userId));
		
		model.addAttribute("member", mservice.getMember(userId));
			
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_team", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UsersDetailVO> returnTeamInfo(@RequestParam("team") String team, Model model) {
		log.info("팀 진입" + team);
		
		
		return tempselectservice.selectAbleMember(team);
	}
	
	@ResponseBody
	@PostMapping("/select_temp_approver")
	public ManagerVO select_temp(ManagerVO managervo) {
		
		String temp = managervo.getTemp_manager();
		String id = managervo.getManager_id();
		log.info("임시 승인자 : "+temp);
		log.info("승인자 : "+id);
		
		log.info("있는지 확인하기 리스트" + AdminTempService.IsInTemp(id).get(0).getTemp_manager());
		String check =AdminTempService.IsInTemp(id).get(0).getTemp_manager(); //임시 승인자 지정확인
		log.info("해당 파트에 임시 승인자가 있는지 확인 있으면1? "+check); 
		if(check != null ) {			
			log.info("이미 임시 승인자가 지정됨");
			String check_id =AdminTempService.IsInTemp(id).get(0).getTemp_manager().toString(); //이미 있는 임시 승인자의 아이디
			
			log.info("이미있는 임시승인자 아이디 : "+check_id); 
			
			AdminTempService.updateTempAuthority("A0", temp); //새로 들어온 사람은 권한업데이트 
			
			AdminTempService.updateTempAuthority("A1", check_id);//이미 있던 임시승인자의 권한을 다시 되돌림
			
			AdminTempService.selectTemp(managervo.getApproval_start(), //매니저 테이블에 삽입한다.
					managervo.getApproval_finish(), 
					managervo.getTemp_manager(),
					managervo.getManager_id()); 

		
		}else {//임시 승인자 지정 안되있음.
			log.info("최초 임시 승인자 지정");
			AdminTempService.updateTempAuthority("A0", temp); //권한을 업데이트하고 

			AdminTempService.selectTemp(managervo.getApproval_start(), //매니저 테이블에 삽입한다.
					managervo.getApproval_finish(), 
					managervo.getTemp_manager(),
					managervo.getManager_id()); 

		}
		
		return managervo;
	}
	
	
	@ResponseBody
	@PostMapping("/del_temp")
	public ManagerVO del_temp(ManagerVO managervo ) {
		
		AdminTempService.delTempManger(managervo.getTemp_manager());
		
		AdminTempService.updateTempAuthority("A1", managervo.getTemp_manager());
		
		return managervo;
	}
	
	@ResponseBody 
	@GetMapping(value = "/check_temp", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<TempManagerInfoVO> returnTempInfo(@RequestParam("dept_id") String dept_id) {
		
		log.info("임시 승인자 확인");
		
		return AdminTempService.showTempInfo(dept_id);
	}
	
}
