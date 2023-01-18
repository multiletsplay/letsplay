package com.letplay.letplaytest.biz;

import com.letplay.letplaytest.dto.LikesDto;

public interface LikesBiz {
	public int insertfac(LikesDto dto);
	public int deletefac(int facSeq, String id);
	public int selectfac(int facSeq, String id);
	
	public int insertles(LikesDto dto);
	public int deleteles(int lesSeq, String id);
	public int selectles(int lesSeq, String id);
	
	public int insertmat(LikesDto dto);
	public int deletemat(int matchSeq, String id);
	public int selectmat(int matchSeq, String id);
}
