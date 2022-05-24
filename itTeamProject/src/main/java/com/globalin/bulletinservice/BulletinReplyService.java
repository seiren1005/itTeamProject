package com.globalin.bulletinservice;

import java.util.List;

import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinReplyPage;
import com.globalin.bulletindomain.BulletinReplyVO;

// standard function of reply
public interface BulletinReplyService {

	public int register(BulletinReplyVO rvo);
	
	public BulletinReplyVO selectOne(int rno);
	
	public int update(BulletinReplyVO rvo);
	
	public int delete(int rno);
	
	// 기존 리스트만 조회
	public List<BulletinReplyVO> getReplyList(BulletinCriteria cri, int bno);
	
	// 리스트 + 총 댓글 갯수 (해당 게시물만)
	public BulletinReplyPage getReplyListWithPage(BulletinCriteria cri, int bno);
	
	
}
