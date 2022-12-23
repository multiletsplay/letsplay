package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.MatchMapper;
import com.letplay.letplaytest.dto.MatchDto;

@Service
public class MatchImpl implements MatchBiz {

	@Autowired
	private MatchMapper matchMapper;

	@Override
	public List<MatchDto> selectList() {
		return matchMapper.selectList();
	}
	
	@Override
	public MatchDto selectOne(int matchSeq) {
		return matchMapper.selectOne(matchSeq);
	}

	@Override
	public int insert(MatchDto dto) {
		return matchMapper.insert(dto);
	}

	@Override
	public int update(MatchDto dto) {
		return 0;
	}

	@Override
	public int delete(int matchSeq) {
		return 0;
	}

	
}
