package com.globalin.mapper;

import java.util.List;

import com.globalin.domain.BoardVO;

public interface BoardMapper {

	// Create
	public void insert(BoardVO bvo);
		
	// Read
	public BoardVO selectOne(int bno);
	
	// list
	public List<BoardVO> selectAll();
	
	// Update
	public int update(BoardVO bvo);
		
	// Delete
	public int delete(int bno);
		
	
}
