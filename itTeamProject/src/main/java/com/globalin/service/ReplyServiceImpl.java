package com.globalin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;
import com.globalin.mapper.BoardMapper;
import com.globalin.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper rMapper;
	
	@Autowired
	private BoardMapper bMapper;
	
	private Logger log = 
			LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	
	@Override
	public int register(ReplyVO rvo) {
		// TODO Auto-generated method stub
		
		log.info("Write: " + rvo);
		
		// bno 의 댓글수 +1
		bMapper.updateReplyCnt(rvo.getBno(), 1);
		
		return rMapper.insert(rvo);
		
	}
	

	@Override
	public ReplyVO selectOne(int rno) {
		// TODO Auto-generated method stub
		
		log.info("View a reply: " + rno);
		
		return rMapper.selectOne(rno);
		
	}

	
	@Override
	public int update(ReplyVO rvo) {
		// TODO Auto-generated method stub
		
		log.info("Update: " + rvo);
		
		return rMapper.update(rvo);
		
	}

	
	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		
		log.info("Delete: " + rno);
		
		ReplyVO rvo = rMapper.selectOne(rno);
		
		// 삭제 시 해당 bno 의 댓글 수 -1
		bMapper.updateReplyCnt(rvo.getBno(), -1);
		
		return rMapper.delete(rno);
		
	}
	

	@Override
	public List<ReplyVO> getReplyList(Criteria cri, int bno) {
		// TODO Auto-generated method stub
		
		log.info("Get replies: " + bno);
		
		return rMapper.selectAllWithPaging(cri, bno);
		
	}

	@Override
	public ReplyPage getReplyListWithPage(Criteria cri, int bno) {
		// TODO Auto-generated method stub
		
		ReplyPage rPage = new ReplyPage();
		
		log.info("cri: " + cri);
		
		rPage.setReplyCnt(rMapper.getCountReplyByBno(bno));
		rPage.setReplyList(rMapper.selectAllWithPaging(cri, bno));
		
		return rPage;
		
	}
	

}
