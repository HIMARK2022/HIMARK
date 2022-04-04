package com.himark.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himark.domain.ApproveListManageVO;
import com.himark.service.ApproveListManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminApproveListManageController {
	private ApproveListManageService service;
	
	@ResponseBody
	@GetMapping("/uppercategory")
	public List<String> uppercategory() {
		log.info("승인 안건 목록");
		//model.addAttribute("upper", service.getUpperList());
		log.info(service.getUpperList());
	
		return service.getUpperList();
	}
	
	/*
	 * @GetMapping("/category") public void category() {
	 * 
	 * }
	 */
	@ResponseBody 
	@GetMapping(value = "/category", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ApproveListManageVO> category(@RequestParam("upper_classify_name") String upper_classify_name) {
		log.info("상위분류 : "+upper_classify_name);
		log.info(service.getCategory(upper_classify_name));
		return service.getCategory(upper_classify_name);
	}
	
	@DeleteMapping(value="/approve_list_del/{classify_name}", produces = {
			MediaType.TEXT_PLAIN_VALUE
	}) 
	public ResponseEntity<String> remove(@PathVariable("classify_name") String classify_name){
	log.info("한번에 나오자"+classify_name);
	service.delList(classify_name);
	log.info("삭제 완료");
	return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/approve_list_mod/{mod_name}/{mod_period}",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ApproveListManageVO amvo, @PathVariable("mod_name") String mod_name,@PathVariable("mod_period") String mod_period) {

		log.info("amvo : "+amvo);
		service.modList(mod_name, mod_period,amvo);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/approve_list_mod/{mod_name}",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> uppermodify(
			@RequestBody ApproveListManageVO amvo, @PathVariable("mod_name") String mod_name) {
		
		log.info("amvo : "+amvo);
		log.info("mod_name : "+mod_name);
		service.uppermodList(mod_name,amvo);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/approve_list_add")
	public ApproveListManageVO add(Model model ,ApproveListManageVO amvo) {
		log.info(amvo.getUpper_classify_name());
		log.info(amvo.getClassify_name());
		log.info(amvo.getApproval_period());
		service.insertNewList(amvo);
		return amvo;
	}
	
	@ResponseBody
	@PostMapping("/approve_upperlist_add")
	public String addupper(Model model ,ApproveListManageVO amvo) {
		log.info(amvo.getUpper_classify_name());
		log.info(amvo.getClassify_name());
		log.info(amvo.getApproval_period());
		service.insertNewList(amvo);
		return amvo.getClassify_name();
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
	@PostMapping("/approve_upperlist_check")
    @ResponseBody
    public int isInUpperCheck(@RequestParam("upper_classify_name") String upper_classify_name){
        log.info("userIdUpperCheck 진입");
        log.info("전달받은 id:"+upper_classify_name);
        int cnt = service.isInUpperCheck(upper_classify_name);
        log.info("확인 결과:"+cnt);
        return cnt;
    }
}
