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
	@GetMapping("/approver_list")
	public void tree(Model model , @RequestParam("userId")String userId) {
		log.info("일반 사용자 승인자 리스트 ");
		model.addAttribute("team", service.getTeamL(userId));
		log.info(service.getTeamL(userId));
		model.addAttribute("depart", service.getDepartL(userId));
		model.addAttribute("upper", service.getUpperL(userId));
		model.addAttribute("alluser", service.searchAll());
		/*
		 * String team_name = service.getTeamL(userId).get(0).getDept_name().toString();
		 * String depart_name =
		 * service.getDepartL(userId).get(0).getDept_name().toString(); String
		 * upper_name = service.getUpperL(userId).get(0).getDept_name().toString();
		 */
		/*
		 * model.addAttribute("Tempteam", service.tempManagerT(team_name));
		 * model.addAttribute("Tempdepart", service.tempManagerD(depart_name));
		 * model.addAttribute("Tempupper", service.tempManagerH(upper_name));
		 * if(service.tempManagerT(team_name).size() != 0) { String tid =
		 * service.tempManagerT(team_name).get(0).getUser_id().toString();
		 * service2.searchUserById(tid);
		 * model.addAttribute("user_team",service2.searchUserById(tid)); }
		 * if(service.tempManagerD(depart_name).size() != 0) { String did =
		 * service.tempManagerD(depart_name).get(0).getUser_id().toString();
		 * service2.searchUserById(did);
		 * model.addAttribute("user_dept",service2.searchUserById(did)); }
		 * if(service.tempManagerH(upper_name).size() != 0) { String uid =
		 * service.tempManagerH(upper_name).get(0).getUser_id().toString();
		 * service2.searchUserById(uid);
		 * model.addAttribute("user_upper",service2.searchUserById(uid)); }
		 */

	}
}