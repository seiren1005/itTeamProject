package com.globalin.bulletinservice;

import java.util.List;

import com.globalin.bulletindomain.BulletinBoardVO;
import com.globalin.bulletindomain.BulletinCriteria;
import com.globalin.bulletindomain.BulletinFileVO;

public interface BulletinBoardService {
	
	// register a content
	public void register(BulletinBoardVO bvo);
	
	// select one content
	public BulletinBoardVO get(int bno);
	
	// Select All contents
	public List<BulletinBoardVO> getList();
	
	// select all contents with page processing
	public List<BulletinBoardVO> getList(BulletinCriteria cri);
	
	// modify a content
	public boolean modify(BulletinBoardVO bvo);
	
	// delete a content
	public boolean remove(int bno);
	
	// Get total count at board
	public int getTotal(BulletinCriteria cri);
	
	// insert file info
	public void registerFile(BulletinFileVO fvo);
	

}
