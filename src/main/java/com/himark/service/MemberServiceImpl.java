package com.himark.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.himark.domain.MemberVO;
import com.himark.domain.TempManagerInfoVO;
import com.himark.domain.UsersDetailVO;
import com.himark.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper mapper;
	
	@Override
	public UsersDetailVO getMember(String userId) {
		return mapper.getMember(userId);
	}
	
	@Override
	public MemberVO getApproverList(String managerId) {
		// TODO Auto-generated method stub
		return mapper.getApproverList(managerId);
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
	
	@Override
	public MemberVO getApprover(String userId) {
		return mapper.getApprover(userId);
	}

	@Override
	public UsersDetailVO getCeo() {
		// TODO Auto-generated method stub
		return mapper.getCeo();
	}

	@Override
	public TempManagerInfoVO getTempApprover(String manager) {
		// TODO Auto-generated method stub
		return mapper.getTempManager(manager);
	}

	@Override
	public String getTempOrigin(String userId) {
		// TODO Auto-generated method stub
		return mapper.getTempOrigin(userId);
	}
		
	@Override
	public int countUser() {
		return mapper.countUser();

	}


}
