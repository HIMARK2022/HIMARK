package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.service.ApproveListManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminApproveListManageController {
	private ApproveListManageService service;
	@GetMapping("/approve_list")
	public void list(Model model) {
		log.info("승인 안건 목록");
		model.addAttribute("all", service.getAllList());
		log.info(service.getAllList());
	}
	@PostMapping("/approve_list_del")
	public String del(Model model ,@RequestParam("delList")String delList) {
		log.info("한번에 나오자"+delList);
		service.delList(delList);
		log.info("삭제 완료");
		return "redirect:/admin/approve_list";
	}
	@PostMapping("/approve_list_mod")
	public String mod(Model model ,@RequestParam("mod_name")String mod_name,@RequestParam("mod_period")String mod_period
			,@RequestParam("org_name")String org_name,@RequestParam("org_period")String org_period) {

		service.modList(mod_name, mod_period, org_name, org_period);
		
		return "redirect:/admin/approve_list";
	}
	@PostMapping("/approve_list_add")
	public String add(Model model ,@RequestParam("classify_name")String classify_name,@RequestParam("approval_period")String approval_period) {
		log.info(classify_name);
		log.info(approval_period);
		service.insertNewList( classify_name, approval_period);
		return "redirect:/admin/approve_list";
	}
	@PostMapping("/approve_list_check")
    @ResponseBody
    public int isInCheck(@RequestParam("classify_name") String classify_name){
        log.info("userIdCheck 진입");
        log.info("전달받은 id:"+classify_name);
        int cnt = service.isInCheck(classify_name);
        log.info("확인 결과:"+cnt);
        return cnt;
    }
}
