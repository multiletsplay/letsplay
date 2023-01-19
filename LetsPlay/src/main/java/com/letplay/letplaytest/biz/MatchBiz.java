package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.ReplyDto;
import com.letplay.letplaytest.dto.SearchDto;

public interface MatchBiz {
	public List<MatchDto> selectMatchList();
	public List<MatchDto> selectSports(int spoId);
	public MatchDto selectMatchOne(int matchSeq);
	public List<MatchDto> searchMatch(SearchDto dto); //매칭 검색
	public int insertMatch(MatchDto dto);
	public int updateMatch(MatchDto dto);
	public int deleteMatch(int matchSeq);
	public int matchListCount(); 			//글 개수
	public List<MatchDto> selectEndList(int spoId); //마감된 게시글 목록
	public int matchEndCount();				//마감된 글 개수
//	public List<MatchDto> joinMatchList(String id);
	public int joinMatch(int matchSeq);		//참여하기
	//댓글
	public int insertReply(String repContent, String id, int matchSeq);
	public List<ReplyDto> selectReplyList(int matchSeq);
	public int delReply(int repSeq);
	public int cntReply(int matchSeq);		//댓글 수
	
}
