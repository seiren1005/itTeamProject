package com.globalin.bulletinservice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.bulletindomain.BulletinBoardVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;
import com.globalin.bulletinmapper.BulletinBoardMapper;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService {

	// logger for saving status
	private Logger log = 
			LoggerFactory.getLogger(BulletinBoardServiceImpl.class);
	
	@Autowired
	private BulletinBoardMapper mapper;

	
	@Override
	public void register(BulletinBoardVO bvo) {
		// TODO Auto-generated method stub
		
		log.info("Register board: " + bvo);
		mapper.insertSelectKey(bvo);
		
	}

	@Override
	public BulletinBoardVO get(int bno) {
		// TODO Auto-generated method stub
		
		log.info(""+bno);
		
		BulletinBoardVO bvo = mapper.selectOne(bno);
		
		return bvo;
		
	}
	

	@Override
	public List<BulletinBoardVO> getList() {
		// TODO Auto-generated method stub
		
		log.info("View All contents.");
		
		return mapper.selectAll();
		
	}

	
	@Override
	public List<BulletinBoardVO> getList(BulletinCriteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Board Page Inquiry: " + cri);
		
		return mapper.selectAllWithPage(cri);
		
	}
		

	@Override
	public boolean modify(BulletinBoardVO bvo) {
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
	public int getTotal(BulletinCriteria cri) {
		// TODO Auto-generated method stub
		
		log.info("Get total count of board");
		
		return mapper.getTotalCount(cri);
		
	}
	
	
	@Override
	public void registerFile(BulletinFileVO fvo) {
		// TODO Auto-generated method stub
		log.info("Register file info: " + fvo);
		
		mapper.insertFile(fvo);
		
	}
	
	
}
