package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.MatchDto;
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

	@Select(" "
			+ " SELECT "
				+ " match_seq as matchSeq, "
				+ " id, "
				+ " spo_id as spoId, "
				+ " match_title as matchTitle, "
				+ " match_content as matchContent, "
				+ " match_regdate as matchRegdate, "
				+ " match_modidate as matchModidate, "
				+ " match_enddate as matchEnddate, "
				+ " match_location as matchLocation, "
				+ " match_total as matchTotal, "
				+ " match_cnt as matchCnt, "
				+ " match_level as matchLevel, "
				+ " match_facility as matchFacility, "
				+ " match_status as matchStatus, "
				+ " (select count(reply.rep_seq)"
				+ " 	from reply"
				+ " 	where match_seq=matchSeq) cntComment "
				+ " FROM "
				+ " 	MATCH_BOARD "
				+ " ORDER BY "
				+ " matchSeq DESC ")
	List<MatchDto> selectList();

	@Select(" "
			+ " SELECT "
			+ " match_seq as matchSeq, "
			+ " id, "
			+ " spo_id as spoId, "
			+ " match_title as matchTitle, "
			+ " match_content as matchContent, "
			+ " match_regdate as matchRegdate, "
			+ " match_modidate as matchModidate, "
			+ " match_enddate as matchEnddate, "
			+ " match_location as matchLocation, "
			+ " match_total as matchTotal, "
			+ " match_cnt as matchCnt, "
			+ " match_level as matchLevel, "
			+ " match_facility as matchFacility, "
			+ " match_status as matchStatus, "
			+ " (select count(reply.rep_seq)"
			+ " 	from reply"
			+ " 	where match_seq=matchSeq) cntComment "
			+ " FROM "
			+ " 	MATCH_BOARD "
			+ " WHERE "
			+ " MATCH_SEQ=#{matchSeq} ")
	MatchDto selectOne(int matchSeq);

	@Insert(" INSERT INTO MATCH_BOARD VALUES(NULL, #{id}, #{spoId}, #{matchTitle}, #{matchContent}, #{matchRegdate}, #{matchModidate}, #{matchEnddate}, #{matchLocation}, #{matchTotal}, #{matchCnt}, #{matchLevel}, #{matchFacility}, #{matchStatus}, #{cntComment}) ")
	int insert(MatchDto dto);

	@Update(" UPDATE MATCH_BOARD SET MATCH_TITLE=#{matchTitle}, MATCH_CONTENT=#{matchContent}, MATCH_LOCATION=#{matchLocation}, MATCH_TOTAL=#{matchTotal}, MTACH_CNT=#{matchCnt}, MATCH_LEVEL=#{matchLevel}, MATCH_FACILITY=#{matchFacility} WHERE MATCH_SEQ=#{matchSeq} ")
	int update(MatchDto dto);

	@Delete(" DELETE FROM MATCH_BOARD WHERE MATCH_SEQ = #{matchSeq} ")
	int delete(int matchSeq);

}
