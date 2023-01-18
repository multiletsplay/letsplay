package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.ReplyDto;
import com.letplay.letplaytest.dto.SearchDto;
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

	@Select(" SELECT m.*, s.SPO_NAME, "
			+ "(select count(r.REP_SEQ)"
			+ "		FROM REPLY r"
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) cntComment "
			+ " FROM MATCH_BOARD m, SPORTS s "
			+ " WHERE m.SPO_ID = s.SPO_ID AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE "
			+ " ORDER BY "
			+ " m.MATCH_SEQ DESC ")
	List<MatchDto> selectMatchList();
	
	@Select("SELECT MATCH_SEQ, ID, SPO_NAME, MATCH_TITLE, MATCH_REGDATE, MATCH_ENDDATE, MATCH_LOCATION, START_TIME, END_TIME, MATCH_CNT, MATCH_TOTAL, MATCH_LEVEL, "
			+ "	(SELECT COUNT(REPLY.REP_SEQ) "
			+ "		FROM REPLY"
			+ "		WHERE MATCH_BOARD.MATCH_SEQ=REPLY.MATCH_SEQ) cntComment "
			+ " FROM MATCH_BOARD, SPORTS "
			+ " WHERE MATCH_BOARD.SPO_ID = SPORTS.SPO_ID AND MATCH_BOARD.SPO_ID = #{spoId} AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE "
			+ " ORDER BY "
			+ " MATCH_SEQ DESC ")
	List<MatchDto> selectSports(int spoId);

	@Select(" SELECT m.*, s.SPO_NAME, MEMBER.ID "
			+ "	(SELECT COUNT(r.REP_SEQ)"
			+ "		FROM REPLY r "
			+ "		where m.match_seq=r.match_seq) cntComment"
				+ " FROM "
				+ " MATCH_BOARD m, SPORTS s, MEMBER"
				+ " WHERE "
				+ " M.SPO_ID = S.SPO_ID AND MATCH_SEQ=#{matchSeq} ")
	MatchDto selectMatchOne(int matchSeq);

	@Insert(" INSERT INTO MATCH_BOARD VALUES(NULL, #{id}, #{spoId}, #{matchTitle}, #{matchContent}, NOW(), NOW(), #{matchEnddate}, #{matchLocation}, #{matchTotal}, #{matchCnt}, #{matchLevel}, #{matchFacility}, DEFAULT, #{cntComment}, #{startTime}, #{endTime}) ")
	int insertMatch(MatchDto dto);

	@Update(" UPDATE MATCH_BOARD SET MATCH_TITLE=#{matchTitle}, MATCH_CONTENT=#{matchContent}, MATCH_ENDDATE=#{matchEnddate}, MATCH_LOCATION=#{matchLocation}, MATCH_TOTAL=#{matchTotal}, MATCH_CNT=#{matchCnt}, MATCH_LEVEL=#{matchLevel}, MATCH_FACILITY=#{matchFacility}, START_TIME=#{startTime}, ENDTIME=#{endTime} WHERE MATCH_SEQ=#{matchSeq} ")
	int updateMatch(MatchDto dto);

	@Delete(" DELETE FROM MATCH_BOARD WHERE MATCH_SEQ = #{matchSeq} ")
	int deleteMatch(int matchSeq);

	@Insert(" INSERT INTO REPLY () VALUES( NULL, #{matchSeq}, #{id}, #{repContent}, NOW()) ")
	int insertReply(String repContent, String id, int matchSeq);

	@Select("SELECT * "
				+ " FROM REPLY "
				+ " WHERE MATCH_SEQ=#{matchSeq} ")
	List<ReplyDto> selectReplyList(int matchSeq);

	
//	@Select(" select m.id "
//			+ " from member m "
//			+ " where match_board.match_seq=#{matchSeq}")
//	List<MatchDto> joinMatchList(String id);
	
	@Update(" UPDATE MATCH_BOARD SET MATCH_BOARD.MATCH_CNT=MATCH_BOARD.MATCH_CNT + 1 "
			+ " WHERE "
			+ " MATCH_BOARD.MATCH_SEQ=#{matchSeq} ")
	int joinMatch(int matchSeq);
	
	
	
	@Update(" UPDATE MATCH_BOARD "
			+ " SET CNT_COMMENT = "
					+ "(SELECT COUNT(REPLY.REP_SEQ)"
					+ "FROM REPLY"
					+ "WHERE MATCH_SEQ = #{matchSeq}) "
			+ "WHERE MATCH_SEQ = #{matchSeq} "
			+ "SELECT CNT_COMMENT AS cntComment"
			+ "FROM MATCH_BOARD"
			+ "WHERE MATCH_SEQ = #{matchSeq}" )
	int cntReply(int matchSeq);

	@Delete(" DELETE FROM REPLY WHERE REP_SEQ=#{repSeq} ")
	int delReply(int repSeq);



	@Select(" SELECT COUNT(*) FROM MATCH_BOARD"
			+ " WHERE MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE ")
	int matchListCount();
	
	@Select(" SELECT COUNT(*) FROM MATCH_BOARD"
			+ " WHERE MATCH_ENDDATE < MATCH_REGDATE ")
	int matchEndCount();

	@Select(" SELECT MATCH_SEQ, ID, SPO_NAME, MATCH_TITLE, MATCH_REGDATE, MATCH_ENDDATE, MATCH_LOCATION, START_TIME, END_TIME, MATCH_CNT, MATCH_TOTAL, MATCH_LEVEL,"
			+ "(SELECT COUNT(REPLY.REP_SEQ)"
			+ "		FROM REPLY"
			+ "		WHERE MATCH_BOARD.MATCH_SEQ=REPLY.MATCH_SEq) cntComment "
			+ " FROM MATCH_BOARD, SPORTS "
			+ " WHERE MATCH_BOARD.SPO_ID = SPORTS.SPO_ID AND MATCH_BOARD.SPO_ID = #{spoId} AND MATCH_ENDDATE < MATCH_REGDATE "
			+ " ORDER BY "
			+ " MATCH_SEQ DESC ")
	List<MatchDto> selectEndList(int spoId);


	@Select( {"<script>",
		" SELECT m.*, s.SPO_NAME  ",
		" FROM MATCH_BOARD m INNER JOIN SPORTS s ON m.SPO_ID = s.SPO_ID ",
		" <where>",
		" 	<if test='searchRegion1 != null'>MATCH_LOCATION LIKE CONCAT(#{searchRegion1},'%') </if> ",
		"	<if test='searchRegion2 != null'>AND MATCH_LOCATION LIKE CONCAT('%',#{searchRegion2},'%') </if>",
		"   <if test='searchDate != null'>AND MATCH_REGDATE LIKE CONCAT('%',#{searchDate},'%') </if>",
		"	<if test='searchFacStatus != null'>AND MATCH_FACILITY=#{searchFacStatus} </if>",
		"	<if test='searchLevel != null'>AND MATCH_LEVEL=#{searchLevel} </if>",
//		"   <if test='searchDate != null or !searchDate.equals(\"\") '>AND MATCH_REGDATE like concat('%'#{searchDate}'%') </if>",
//		" 	<if test='optParking == true '>AND FAC_PARKING=#{optParking} </if> ",
//		" 	<if test='optLent == true'>AND FAC_LENT=#{optLent} </if> ",
//		" 	<if test='optShower == true'>AND FAC_SHOWER=#{optShower} </if> ",
//		" 	<if test='optLocker == true'>AND FAC_LOCKER=#{optLocker} </if> ",
//		" 	<if test='optLight == true'>AND FAC_LIGHT=#{optLight} </if> ",
//		" 	<if test='optCost == true'>AND FAC_COSTCHECK=#{optCost} </if> ",
//		" 	<if test='optCost == false'>AND FAC_COSTCHECK=false </if> ",
		" </where> ",
		" order by match_seq desc",
		" </script>"
})
//	@Select(" SELECT m.*, s.SPO_NAME, "
//			+ "(select count(r.REP_SEQ)"
//			+ "		from reply r"
//			+ "		where m.match_seq=r.match_seq) cntComment "
//			+ " FROM MATCH_BOARD m, sports s "
//			+ " where m.spo_id = s.spo_id and match_regdate between match_regdate and match_enddate"
//			+ " and m.match_location like '%'#{searchRegion1}'%' "
//			+ " and m.match_location like '%'#{searchRegion2}'%' "
//			+ " and m.match_regdate = #{searchDate} "
//			+ " and m.match_level = #{searchLevel} "
//			+ "	ORDER BY "
//			+ " m.MATCH_SEQ DESC ")
	List<MatchDto> searchMatch(SearchDto dto);

	
	
	
	
	
}
