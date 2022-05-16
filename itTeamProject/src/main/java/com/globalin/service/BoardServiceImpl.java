package com.globalin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.globalin.domain.BoardVO;

public class BoardServiceImpl implements BoardService {

	// logger for saving status
	private Logger log = 
			LoggerFactory.getLogger(BoardServiceImpl.class);
	
	
	@Override
	public void register(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("register a content: " + bvo);
		
	}

	@Override
	public BoardVO get(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int bno) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
