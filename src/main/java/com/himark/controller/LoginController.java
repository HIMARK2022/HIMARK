package com.himark.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.MemberVO;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class LoginController {
	private MemberService service;
	
	@GetMapping("/login")
	public void login() {
		log.info("login");
	}
	
	@ResponseBody
	@PostMapping("/login")
	public MemberVO loginProcess(MemberVO vo, Model model, HttpServletRequest request) throws IOException {
		log.info("로그인 처리");
		
		MemberVO result = new MemberVO(); // 반환할 값
		
		// 데이터가 없는 경우
		int countUser = service.countUser();
		if(countUser == 0) {
			result.setAuthorityCode("dss");
			
			return result;
		}
		
		HttpSession session = request.getSession();
		
		MemberVO loginUser = service.login(vo);
		
		result.setAuthorityCode("none"); // 일치하는 아이디, 비밀번호가 없음
		
		if(loginUser != null) {
			// 권한 체크
			String auth = loginUser.getAuthorityCode();
			
			if(vo.getAuthorityCode().contains(auth)) {
				session.setAttribute("loginUser", loginUser);
				
				if("일반 사용자".equals(auth)) {
					result.setAuthorityCode("general");
				} else if("승인자".equals(auth)) {
					result.setAuthorityCode("approver");
				} else if("임시 승인자".equals(auth)) {
					result.setAuthorityCode("approver");
				} else { // 관리자
					result.setAuthorityCode("admin");
				}
				 
			} else {
				result.setAuthorityCode("wrong");
			}
			
			result.setUserId(loginUser.getUserId());
		}
		
		return result;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception{		
		session.invalidate();
		
		return "redirect:/login";
	}
}
