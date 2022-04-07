package com.himark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.himark.domain.MemberVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j

@AllArgsConstructor
@RequestMapping({"/general/*","/approver/*"})
public class InfoController {
private MemberService mservice;
	
	
	@GetMapping({"/myinfo","/myinfo"})
	public void get(@RequestParam("userName") String userName, Model model) {
		log.info("/myinfo");
		log.info(userName);
		model.addAttribute("member", mservice.getMember(userName));
	}
	
		
		@GetMapping("/approver_list")
		public void approverList(@RequestParam("userId") String userId, Model model, MemberVO member) {
			List<MemberVO> list = new ArrayList<MemberVO>();
			List<TempManagerInfoVO> tlist = new ArrayList<TempManagerInfoVO>();
			String managerId = mservice.getApprover(userId).getUserId();
			boolean tf=true;
		
			while(tf==true) {
				if(mservice.getApprover(managerId) != null) {
					System.out.println(managerId);
					mservice.getApproverList(managerId);
					list.add(mservice.getApproverList(managerId));
					managerId = mservice.getApprover(managerId).getUserId();
					
				}
				else {
					list.add(mservice.getApproverList(managerId));
					tf = false;
				}	
			}
			
			log.info("=================list.size() 출력: "+list.size());	
			for(MemberVO L : list) {
				System.out.println(L);
			}
			
			model.addAttribute("ceo", mservice.getCeo());
			model.addAttribute("member", mservice.getMember(userId));
			model.addAttribute("alist", list);
			
			//임시승인자
			for(int i=0;i<list.size();i++) {
				String manager = list.get(i).getUserId();
				if(mservice.getTempApprover(manager) != null) {
				tlist.add(mservice.getTempApprover(manager));
				}
			}
			
			log.info("=================임시승인자 출력: "+tlist.size());	
			for(TempManagerInfoVO tmp : tlist) {
				System.out.println(tmp);
			}
			model.addAttribute("tlist", tlist);
	}
}
