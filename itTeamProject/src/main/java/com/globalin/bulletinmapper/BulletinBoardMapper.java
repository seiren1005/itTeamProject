package com.globalin.bulletinmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.bulletindomain.BulletinBoardVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;

// required sql for board
public interface BulletinBoardMapper {

	// Create
	public void insert(BulletinBoardVO bvo);
	
	public void insertSelectKey(BulletinBoardVO bvo);
		
	// Read
	public BulletinBoardVO selectOne(int bno);
	
	// list
	public List<BulletinBoardVO> selectAll();
	
	// list with page
	public List<BulletinBoardVO> selectAllWithPage(BulletinCriteria cri);
	
	// Update
	public int update(BulletinBoardVO bvo);
		
	// Delete
	public int delete(int bno);
	
	// Get total count
	public int getTotalCount(BulletinCriteria cri);
	
	// Update reply count
	public void updateReplyCnt(@Param("bno") int bno,
			@Param("amount") int amount);
	
	// 첨부파일 정보 저장
	public void insertFile(BulletinFileVO fvo);
		
	
}
