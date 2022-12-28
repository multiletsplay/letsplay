package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.MatchMapper;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.ReplyDto;

@Service
public class MatchImpl implements MatchBiz {

	@Autowired
	private MatchMapper matchMapper;

	@Override
	public List<MatchDto> selectMatchList() {
		return matchMapper.selectMatchList();
	}
	
	@Override
	public MatchDto selectMatchOne(int matchSeq) {
		return matchMapper.selectMatchOne(matchSeq);
	}

	@Override
	public int insertMatch(MatchDto dto) {
		return matchMapper.insertMatch(dto);
	}

	@Override
	public int updateMatch(MatchDto dto) {
		return matchMapper.updateMatch(dto);
	}

	@Override
	public int deleteMatch(int matchSeq) {
		return matchMapper.deleteMatch(matchSeq);
	}

	@Override
	public int insertReply(String matchContent, String id, int matchSeq) {
		return matchMapper.insertReply(matchContent, id, matchSeq);
	}

	@Override
	public List<ReplyDto> selectReplyList(int matchSeq) {
		return matchMapper.selectReplyList(matchSeq);
	}

	@Override
	public int cntReply(int matchSeq) {
		return matchMapper.cntReply(matchSeq);
	}

	@Override
	public int delReply(int repSeq) {
		return matchMapper.delReply(repSeq);
	}

	@Override
	public int cntSeq(int matchSeq) {
		return matchMapper.cntSeq(matchSeq);
	}

	
}
