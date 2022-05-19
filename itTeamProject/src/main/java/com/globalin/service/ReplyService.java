package com.globalin.service;

import java.util.List;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyPage;
import com.globalin.domain.ReplyVO;

// standard function of reply
public interface ReplyService {

	public int register(ReplyVO rvo);
	
	public ReplyVO selectOne(int rno);
	
	public int update(ReplyVO rvo);
	
	public int delete(int rno);
	
	// 기존 리스트만 조회
	public List<ReplyVO> getReplyList(Criteria cri, int bno);
	
	// 리스트 + 총 댓글 갯수 (해당 게시물만)
	public ReplyPage getReplyListWithPage(Criteria cri, int bno);
	
	
}
