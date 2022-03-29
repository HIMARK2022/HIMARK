package com.himark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.domain.MemberVO;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	private MemberService mservice;
	
	@GetMapping({"/general/home", "/general/dept"})
	public void general_home(Model model, HttpServletRequest request) {
		log.info("general home");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		model.addAttribute("member", mservice.getMember(member.getUserId()));
		String deptId = mservice.getMember(member.getUserId()).getDeptId();
		model.addAttribute("dlist", mservice.getDeptList(deptId));
		log.info(mservice.getDeptList(deptId));
	}
	
	@GetMapping({"/approver/home", "/approver/dept"})
	public void approver_home(Model model, HttpServletRequest request) {
		log.info("approver home");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		model.addAttribute("member", mservice.getMember(member.getUserId()));
		String deptId = mservice.getMember(member.getUserId()).getDeptId();
		model.addAttribute("dlist", mservice.getDeptList(deptId));
		log.info(mservice.getDeptList(deptId));
	}
	
	@GetMapping("/admin/home")
	public void admin_home(Model model, HttpServletRequest request) {
		log.info("admin home");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		model.addAttribute("member", mservice.getMember(member.getUserId()));
	}
}
