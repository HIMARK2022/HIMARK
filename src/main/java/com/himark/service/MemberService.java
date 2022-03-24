package com.himark.service;

import com.himark.domain.MemberVO;

public interface MemberService {
	//회원정보 보기
		public MemberVO getMember(String userId);
}
