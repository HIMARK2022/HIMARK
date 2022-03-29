package com.himark.mapper;

import java.util.List;

import com.himark.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	//public void deleteAll(Long bno);
	public List<BoardAttachVO> findByRno(int rno);
	public void deleteAll(int rno);
	public List<BoardAttachVO> getOldFiles();
}
