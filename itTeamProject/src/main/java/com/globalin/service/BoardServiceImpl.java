package com.globalin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.domain.BoardVO;
import com.globalin.domain.Criteria;
import com.globalin.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	// logger for saving status
	private Logger log = 
			LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardMapper mapper;

	
	@Override
	public void register(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("Register board: " + bvo);
		mapper.insertSelectKey(bvo);
		
	}

	@Override
	public BoardVO get(int bno) {
		// TODO Auto-generated method stub
		
		log.info(""+bno);
		
		BoardVO bvo = mapper.selectOne(bno);
		
		return bvo;
		
	}
	

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		
		log.info("View All contents.");
		
		return mapper.selectAll();
		
	}

	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Board Page Inquiry: " + cri);
		
		return mapper.selectAllWithPage(cri);
		
	}
	
	
	@Override
	public List<BoardVO> getList(Criteria cri, String purp) {
		// TODO Auto-generated method stub
		
		log.info("Board Page Inquiry: " + cri);
		
		return mapper.selectAllWithPagePurp(cri, purp);
		
	}
	

	@Override
	public boolean modify(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("Update successfully!");
		
		return mapper.update(bvo) == 1;
		// mapper.update() 결과는 int 0 or 1
		// update 가 성공하면 1 == 1 -> true;
		// 실패하면 0 == 1 -> false
		
	}

	
	@Override
	public boolean remove(int bno) {
		// TODO Auto-generated method stub
		
		log.info("Delete completely.");
		
		return mapper.delete(bno) == 1;
		
	}
	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Get total count of board");
		
		return mapper.getTotalCount(cri);
		
	}
	
	
	@Override
	public int getTotal(Criteria cri, String purp) {
		// TODO Auto-generated method stub
		
		log.info("Get total count of board");
		
		return mapper.getTotalCountPurp(cri, purp);
		
	}	
	
	
}
