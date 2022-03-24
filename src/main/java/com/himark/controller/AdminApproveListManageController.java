package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	}
}
