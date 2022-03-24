package com.himark.service;

import org.springframework.stereotype.Service;

import com.himark.domain.MemberVO;
import com.himark.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper mapper;
	
	@Override
	public MemberVO getMember(String userId) {
		return mapper.getMember(userId);
	}
}
