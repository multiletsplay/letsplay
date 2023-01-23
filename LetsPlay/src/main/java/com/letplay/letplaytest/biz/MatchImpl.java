package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.MatchMapper;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.MatchJoin;
import com.letplay.letplaytest.dto.ReplyDto;
import com.letplay.letplaytest.dto.SearchDto;

@Service
public class MatchImpl implements MatchBiz {

	@Autowired
	private MatchMapper matchMapper;

	@Override
	public List<MatchDto> selectMatchList(String id) {
		return matchMapper.selectMatchList(id);
	}
	
	@Override
	public List<MatchDto> selectSports(int spoId) {
		return matchMapper.selectSports(spoId);
	}
	
	@Override
	public MatchDto selectMatchOne(int matchSeq, String id) {
		return matchMapper.selectMatchOne(matchSeq, id);
	}
	
	@Override
	public List<MatchDto> searchMatch(SearchDto dto) {
		return matchMapper.searchMatch(dto);
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
	public int insertReply(String repContent, String id, int matchSeq) {
		return matchMapper.insertReply(repContent, id, matchSeq);
	}

	@Override
	public List<ReplyDto> selectReplyList(int matchSeq) {
		return matchMapper.selectReplyList(matchSeq);
	}


	@Override
	public int delReply(int repSeq) {
		return matchMapper.delReply(repSeq);
	}


	@Override
	public int MatchJoin(int matchSeq, String id) {
		return matchMapper.MatchJoin(matchSeq, id);
	}
	
	@Override
	public int MatchUnjoin(int matchSeq, String id) {
		return matchMapper.MatchUnjoin(matchSeq, id);
	}

	@Override
	public int matchListCount() {
		return matchMapper.matchListCount();
	}

	@Override
	public List<MatchDto> selectEndList(int spoId) {
		return matchMapper.selectEndList(spoId);
	}

	@Override
	public int matchEndCount() {
		return matchMapper.matchEndCount();
	}

	@Override
	public List<MatchJoin> selectJoinList(int matchSeq) {
		return matchMapper.selectJoinList(matchSeq);
	}

//	@Override
//	public List<MatchDto> joinMatchList(String id) {
//		return matchMapper.joinMatchList(id);
//	}

	




	
}
