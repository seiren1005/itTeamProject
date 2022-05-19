package com.globalin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.globalin.domain.Criteria;
import com.globalin.domain.ReplyVO;

// required sql for reply
public interface ReplyMapper {

	// reply register
	public int insert(ReplyVO rvo);
	
	// view a reply
	public ReplyVO selectOne(int rno);
	
	// Delete a reply
	public int delete(int rno);
	
	// Update a reply
	public int update(ReplyVO rvo);
	
	// view all replies with paging
	public List<ReplyVO> selectAllWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") int bno);
	
	// Count total replies
	public int getCountReplyByBno(int bno);

	// check is there adopted valed in adoption column
	public int checkAdoption(int bno);
	
}
