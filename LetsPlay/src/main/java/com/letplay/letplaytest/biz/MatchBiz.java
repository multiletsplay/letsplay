package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.ReplyDto;

public interface MatchBiz {
	public List<MatchDto> selectMatchList();
	public MatchDto selectMatchOne(int matchSeq);
	public int insertMatch(MatchDto dto);
	public int updateMatch(MatchDto dto);
	public int deleteMatch(int matchSeq);
	public int cntSeq(int matchSeq);		//글 개수
	public int cntReply(int matchSeq);		//댓글 수
	
	//댓글
	public int insertReply(String repContent, String id, int matchSeq);
	public List<ReplyDto> selectReplyList(int matchSeq);
	public int delReply(int repSeq);
	
}
