package com.himark.service;

import java.util.List;

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
	
	@Override
	public List<MemberVO> getApproverList(String deptId, String duty) {
		// TODO Auto-generated method stub
		return mapper.getApproverList(deptId,duty);
	}
	
	@Override
	public List<MemberVO> getDeptList(String deptId) {
		// TODO Auto-generated method stub
		return mapper.getDeptList(deptId);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}
}
