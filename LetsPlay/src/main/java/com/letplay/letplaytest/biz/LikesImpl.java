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
	public int insertfac(LikesDto dto) {
		return likesMapper.insertfac(dto);
	}

	@Override
	public int deletefac(int facSeq, String id) {
		return likesMapper.deletefac(facSeq, id);
	}

	@Override
	public int selectfac(int facSeq, String id) {
		return likesMapper.selectfac(facSeq, id);
	}

	@Override
	public int insertles(LikesDto dto) {
		return likesMapper.insertles(dto);
	}

	@Override
	public int deleteles(int lesSeq, String id) {
		return likesMapper.deleteles(lesSeq, id);
	}

	@Override
	public int selectles(int lesSeq, String id) {
		return likesMapper.selectles(lesSeq, id);
	}

	@Override
	public int insertMatch(LikesDto dto) {
		return likesMapper.insertMatch(dto);
	}

	@Override
	public int deleteMatch(int matchSeq, String id) {
		return likesMapper.deleteMatch(matchSeq, id);
	}

	@Override
	public int selectMatch(int matchSeq, String id) {
		return likesMapper.selectMatch(matchSeq, id);
	}

}
