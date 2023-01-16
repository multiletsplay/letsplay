package com.letplay.letplaytest.biz;

import com.letplay.letplaytest.dto.LikesDto;

public interface LikesBiz {
	public int insert(LikesDto dto);
	public int delete(int facSeq, String id);
	public int select(int facSeq, String id);
}
