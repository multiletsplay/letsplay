package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.ReplyDto;
/*	`MATCH_SEQ`	int unsigned auto_increment	NOT NULL PRIMARY KEY,
`ID`	VARCHAR(300)	NOT NULL,
`SPO_ID`	INT	NOT NULL,
`MATCH_TITLE`	VARCHAR(100)	NOT NULL,
`MATCH_CONTENT`	VARCHAR(1000)	NULL,
`MATCH_REGDATE`	DATETIME	NOT NULL,
`MATCH_MODIDATE`	DATETIME	NULL,
`MATCH_ENDDATE`	DATETIME	NULL,
`MATCH_LOCATION`	VARCHAR(100)	NULL,
`MATCH_TOTAL`	TINYINT	NOT NULL	DEFAULT '0',
`MATCH_CNT`	INT	NOT NULL	DEFAULT '0',
`MATCH_LEVEL`	INT	NOT NULL	DEFAULT '0',
`MATCH_FACILITY`	VARCHAR(2)	NOT NULL	DEFAULT 'Y',
`MATCH_STATUS`	CHAR(1)	NULL	DEFAULT 'N',
`CNT_COMMENT`	INT	NOT NULL	DEFAULT '0',*/
@Mapper
public interface MatchMapper {

	@Select(" SELECT *, "
			+ " (SELECT COUNT(*) FROM REPLY "
			+ " WHERE MATCH_BOARD.MATCH_SEQ= "
			+ " REPLY.MATCH_SEQ) CNT_COMMENT "
				+ " FROM MATCH_BOARD "
				+ " ORDER BY "
				+ " MATCH_SEQ DESC ")
	List<MatchDto> selectMatchList();
	
	@Select(" SELECT * "
			+ " FROM MATCH_BOARD "
			+ " where spo_id = #{spoId} ")
	List<MatchDto> selectSports(int spoId);

	@Select(" SELECT *, "
				+ " (SELECT COUNT(REPLY.REP_SEQ)"
				+ " 	FROM REPLY"
				+ " 	WHERE MATCH_SEQ=#{matchSeq}) CNTCOMMENT "
				+ " FROM "
				+ " 	MATCH_BOARD "
				+ " WHERE "
				+ " MATCH_SEQ=#{matchSeq} ")
	MatchDto selectMatchOne(int matchSeq);

	@Insert(" INSERT INTO MATCH_BOARD VALUES(NULL, #{id}, #{spoId}, #{matchTitle}, #{matchContent}, NOW(), NOW(), #{matchEnddate}, #{matchLocation}, #{matchTotal}, #{matchCnt}, #{matchLevel}, #{matchFacility}, DEFAULT, DEFAULT) ")
	int insertMatch(MatchDto dto);

	@Update(" UPDATE MATCH_BOARD SET MATCH_TITLE=#{matchTitle}, MATCH_CONTENT=#{matchContent}, MATCH_ENDDATE=#{matchEnddate}, MATCH_LOCATION=#{matchLocation}, MATCH_TOTAL=#{matchTotal}, MATCH_CNT=#{matchCnt}, MATCH_LEVEL=#{matchLevel}, MATCH_FACILITY=#{matchFacility} WHERE MATCH_SEQ=#{matchSeq} ")
	int updateMatch(MatchDto dto);

	@Delete(" DELETE FROM MATCH_BOARD WHERE MATCH_SEQ = #{matchSeq} ")
	int deleteMatch(int matchSeq);

	@Insert(" INSERT INTO REPLY () VALUES( NULL, #{matchSeq}, #{id}, #{repContent}, NOW()) ")
	int insertReply(String repContent, String id, int matchSeq);

	@Select("SELECT * "
				+ " FROM REPLY "
				+ " WHERE MATCH_SEQ=#{matchSeq} ORDER BY REP_REGDATE ASC")
	List<ReplyDto> selectReplyList(int matchSeq);

	@Update(" UPDATE MATCH_BOARD"
				+ " SET CNT_COMMENT = "
					+ " (SELECT COUNT(REPLY.REP_SEQ)"
					+ " FROM REPLY"
					+ " WHERE MATCH_SEQ = #{matchSeq}) "
				+ " WHERE MATCH_SEQ = #{matchSeq} "
				+ " SELECT CNT_COMMENT AS CNTCOMMENT "
				+ " FROM MATCH_BOARD "
				+ " WHERE MATCH_SEQ = #{matchSeq} ")
	int cntReply(int matchSeq);

	@Delete(" DELETE FROM REPLY WHERE REP_SEQ=#{repSeq} ")
	int delReply(int repSeq);


	@Update("UPDATE MATCH_BOARD SET MATCH_BOARD.MATCH_CNT=MATCH_BOARD.MATCH_CNT + 1 WHERE MATCH_BOARD.MATCH_SEQ=#{matchSeq}")
	int joinMatch(int matchSeq);

	@Select(" SELECT COUNT(*) FROM MATCH_BOARD ")
	int matchListCount();


	
	
	
	
	
}
