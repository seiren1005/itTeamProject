package com.globalin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;

// required sql for board
public interface BoardMapper {

	// Create
	public void insert(BoardVO bvo);
	
	public void insertSelectKey(BoardVO bvo);
		
	// Read
	public BoardVO selectOne(int bno);
	
	// list
	public List<BoardVO> selectAll();
	
	// list with page
	public List<BoardVO> selectAllWithPage(Criteria cri);
	
	// Update
	public int update(BoardVO bvo);
		
	// Delete
	public int delete(int bno);
	
	// Get total count
	public int getTotalCount(Criteria cri);
	
	// Update reply count
	public void updateReplyCnt(@Param("bno") int bno,
			@Param("amount") int amount);
		
	
}
