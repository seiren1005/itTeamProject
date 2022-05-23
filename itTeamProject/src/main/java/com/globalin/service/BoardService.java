package com.globalin.service;

import java.util.List;

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.domain.FileVO;

public interface BoardService {
	
	// register a content
	public void register(BoardVO bvo);
	
	// select one content
	public BoardVO get(int bno);
	
	// Select All contents
	public List<BoardVO> getList();
	
	// select all contents with page processing
	public List<BoardVO> getList(Criteria cri);
	
	// modify a content
	public boolean modify(BoardVO bvo);
	
	// delete a content
	public boolean remove(int bno);
	
	// Get total count at board
	public int getTotal(Criteria cri);
	
	// insert file info
	public void registerFile(FileVO fvo);
	

}
