package com.letplay.letplaytest.biz;

import java.util.List;
import com.letplay.letplaytest.dto.MatchDto;

public interface MatchBiz {
	public List<MatchDto> selectList();
	public MatchDto selectOne(int matchSeq);
	public int insert(MatchDto dto);
	public int update(MatchDto dto);
	public int delete(int matchSeq);
	
}
