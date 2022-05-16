package com.globalin.service;

import java.util.List;

import com.globalin.domain.BoardVO;

public interface BoardService {
	
	// register a content
	public void register(BoardVO bvo);
	
	// select one content
	public BoardVO get(int bno);
	
	// select all contents
	public List<BoardVO> getList();
	
	// modify a content
	public boolean modify(BoardVO board);
	
	// delete a content
	public boolean remove(int bno);
	
}
