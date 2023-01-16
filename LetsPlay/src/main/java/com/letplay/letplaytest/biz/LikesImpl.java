package com.letplay.letplaytest.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.LikesMapper;
import com.letplay.letplaytest.dto.LikesDto;

@Service
public class LikesImpl implements LikesBiz {
	@Autowired
	LikesMapper likesMapper;
	
	@Override
	public int insert(LikesDto dto) {
		return likesMapper.insert(dto);
	}

	@Override
	public int delete(int facSeq, String id) {
		return likesMapper.delete(facSeq, id);
	}

	@Override
	public int select(int facSeq, String id) {
		return likesMapper.select(facSeq, id);
	}

}
