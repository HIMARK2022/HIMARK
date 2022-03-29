package com.himark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.himark.service.AdminHomeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	private AdminHomeService aservice;
	@GetMapping("/home")
	public void main(Model model) {
		model.addAttribute("bonbu",  aservice.getbonbu());
		model.addAttribute("buseo",aservice.getbuseo());
		model.addAttribute("team",aservice.getteam());
		log.info( aservice.getbonbu());
		log.info( aservice.getbuseo());
		log.info( aservice.getteam());
	}
}
