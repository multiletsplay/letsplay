package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.MatchDto;
import com.letplay.letplaytest.dto.MatchJoin;
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
`MATCH_LEVEL`	INT	NOT NULL	DEFAULT '0',
`MATCH_FACILITY`	VARCHAR(2)	NOT NULL	DEFAULT 'Y',
`MATCH_STATUS`	CHAR(1)	NULL	DEFAULT 'N',
`CNT_COMMENT`	INT	NOT NULL	DEFAULT '0',*/
@Mapper
public interface MatchMapper {

	@Select(" SELECT m.*, NICKNAME, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, "
			+ "(SELECT COUNT(r.REP_SEQ) "
			+ "		FROM REPLY r"
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ "(SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m "
			+ " 	LEFT OUTER JOIN SPORTS s ON m.SPO_ID=s.SPO_ID "
			+ "		LEFT OUTER JOIN LIKES l ON m.MATCH_SEQ=l.MATCH_SEQ AND l.ID=#{id} "
			+ "		LEFT OUTER JOIN MEMBER mb ON m.ID=mb.ID "
			+ " WHERE m.SPO_ID = s.SPO_ID AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE AND MATCH_STATUS='N' "
			+ " GROUP BY m.MATCH_SEQ "
			+ " ORDER BY "
			+ " m.MATCH_SEQ DESC ")
	List<MatchDto> selectMatchList(String id);
	
	@Select("SELECT m.*, NICKNAME, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, "
			+ "	(SELECT COUNT(r.REP_SEQ) "
			+ "		FROM REPLY r "
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ " (SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m "
			+ " 	LEFT OUTER JOIN SPORTS s ON m.SPO_ID=s.SPO_ID "
			+ "		LEFT OUTER JOIN LIKES l ON m.MATCH_SEQ=l.MATCH_SEQ AND l.ID=#{id} "
			+ "		LEFT OUTER JOIN MEMBER mb ON m.ID=mb.ID "
			+ " WHERE m.SPO_ID = s.SPO_ID AND m.SPO_ID = #{spoId} AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE "
			+ " GROUP BY m.MATCH_SEQ"
			+ " ORDER BY "
			+ " MATCH_SEQ DESC ")
	List<MatchDto> selectSports(int spoId);

	@Select( {"<script>",
		" SELECT m.*, NICKNAME, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, ",
		" (SELECT COUNT(r.REP_SEQ) ",
		" 		FROM REPLY r ",
		"		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, ",
		" (SELECT COUNT(j.JOIN_SEQ) + 1 ",
		" 		FROM MATCH_JOIN j ",
		"		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN ",
		" FROM MATCH_BOARD m ",
		" 		LEFT OUTER JOIN SPORTS s ON m.SPO_ID = s.SPO_ID ",
		" 		LEFT OUTER JOIN LIKES l ON m.MATCH_SEQ=l.MATCH_SEQ  ",
		"		LEFT OUTER JOIN MEMBER mb ON m.ID=mb.ID ",
		" <where>",
		" 	<if test='searchRegion1 != null'>m.MATCH_LOCATION LIKE CONCAT(#{searchRegion1},'%') </if> ",
		"	<if test='searchRegion2 != null'>AND m.MATCH_LOCATION LIKE CONCAT('%',#{searchRegion2},'%') </if>",
//		"   <if test='searchDate != null'>AND m.MATCH_DAY LIKE CONCAT('%',#{searchDate},'%') </if>",
		"   <if test='searchDate != null'>AND m.MATCH_DAY=#{searchDate} </if>",
		"   <if test='searchStartTime != null'>AND m.START_TIME=#{searchStartTime} </if>",
		"	<if test='searchFacStatus != null'>AND m.MATCH_FACILITY=#{searchFacStatus} </if>",
		"	<if test='searchLevel != null'>AND m.MATCH_LEVEL=#{searchLevel} </if>",
		"	<if test='searchTotal != null'>AND m.MATCH_TOTAL=#{searchTotal} </if>",
		" </where> ",
		" GROUP BY m.MATCH_SEQ ",
		" ORDER BY MATCH_SEQ DESC",
		" </script>"})
	List<MatchDto> searchMatch(SearchDto dto);
	
	@Select(" SELECT m.*, s.SPO_NAME, NICKNAME, FAC_NAME, "
			+ "	(SELECT COUNT(r.REP_SEQ)"
			+ "		FROM REPLY r "
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ "	(SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "	WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN,"
			+ "(SELECT COUNT(j.JOIN_SEQ) "
			+ "		FROM MATCH_JOIN j "
			+ " WHERE j.MATCH_SEQ=#{matchSeq} AND j.id=#{id}) JOIN_STATUS "
				+ " FROM "
				+ "	MATCH_BOARD m, MEMBER mb, SPORTS s, FACILITY f "
				+ " WHERE m.ID=mb.ID AND m.SPO_ID=s.SPO_ID AND m.MATCH_SEQ=#{matchSeq} AND m.FAC_SEQ=f.FAC_SEQ "
		
				)

	MatchDto selectMatchOne(int matchSeq, String id);
	

	@Select(" SELECT m.*, NICKNAME, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, "
			+ "(SELECT COUNT(r.REP_SEQ) "
			+ "		FROM REPLY r"
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ "(SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m "
			+ " 	LEFT OUTER JOIN SPORTS s ON m.SPO_ID=s.SPO_ID "
			+ "		LEFT OUTER JOIN LIKES l ON m.MATCH_SEQ=l.MATCH_SEQ AND l.ID=#{id} "
			+ "		LEFT OUTER JOIN MEMBER mb ON m.ID=mb.ID "
			+ " WHERE m.SPO_ID = #{spoId} AND MATCH_ENDDATE < DATE(NOW())"
			+ " GROUP BY m.MATCH_SEQ "
			+ " ORDER BY "
			+ " m.MATCH_SEQ DESC ")
	List<MatchDto> selectEndList(int spoId);


	@Insert(" INSERT INTO MATCH_BOARD VALUES(NULL, #{id}, #{spoId}, #{matchTitle}, #{matchContent}, NOW(), NOW(), #{matchEnddate}, #{matchLocation}, #{matchTotal}, #{matchLevel}, #{matchFacility}, DEFAULT, #{startTime}, #{endTime}, #{matchDay}, #{facSeq}) ")
	int insertMatch(MatchDto dto);

	@Update(" UPDATE MATCH_BOARD SET MATCH_TITLE=#{matchTitle}, MATCH_CONTENT=#{matchContent}, MATCH_ENDDATE=#{matchEnddate}, MATCH_LOCATION=#{matchLocation}, MATCH_TOTAL=#{matchTotal}, MATCH_LEVEL=#{matchLevel}, MATCH_FACILITY=#{matchFacility}, MATCH_DAY=#{matchDay}, START_TIME=#{startTime}, END_TIME=#{endTime}, FAC_SEQ=#{facSeq} WHERE MATCH_SEQ=#{matchSeq} ")
	int updateMatch(MatchDto dto);

	@Delete(" DELETE FROM MATCH_BOARD WHERE MATCH_SEQ = #{matchSeq} ")
	int deleteMatch(int matchSeq);

	@Insert(" INSERT INTO REPLY () VALUES( NULL, #{matchSeq}, #{id}, #{repContent}, NOW()) ")
	int insertReply(String repContent, String id, int matchSeq);

	@Select("SELECT r.*, NICKNAME "
				+ " FROM REPLY r , MEMBER m "
				+ " WHERE MATCH_SEQ=#{matchSeq} AND r.ID=m.ID ")
	List<ReplyDto> selectReplyList(int matchSeq);

	
//	@Select(" select m.id "
//			+ " from member m "
//			+ " where match_board.match_seq=#{matchSeq}")
//	List<MatchDto> joinMatchList(String id);
	
	@Insert(" INSERT INTO MATCH_JOIN VALUES(NULL, #{matchSeq}, #{id}) ")
	int MatchJoin(int matchSeq, String id);
	
	@Delete(" DELETE FROM MATCH_JOIN WHERE MATCH_SEQ=#{matchSeq} and ID=#{id} ")
	int MatchUnjoin(int matchSeq, String id);
	

	@Delete(" DELETE FROM REPLY WHERE REP_SEQ=#{repSeq} ")
	int delReply(int repSeq);

	@Select(" SELECT COUNT(*) FROM MATCH_BOARD"
			+ " WHERE MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE AND MATCH_STATUS='N' ")
	int matchListCount();
	
	@Select(" SELECT COUNT(*) FROM MATCH_BOARD"
			+ " WHERE MATCH_STATUS='Y' ")
	int matchEndCount();


	@Select(" SELECT NICKNAME FROM MATCH_JOIN, MEMBER WHERE MATCH_SEQ=#{matchSeq} AND MATCH_JOIN.ID=MEMBER.ID ")
	List<MatchJoin> selectJoinList(int matchSeq);

	@Update(" UPDATE MATCH_BOARD SET MATCH_STATUS='Y' WHERE MATCH_SEQ=#{matchSeq} ")
	int fixMatch(int matchSeq);

	@Update(" UPDATE MATCH_BOARD SET MATCH_STATUS='N' WHERE MATCH_SEQ=#{matchSeq} ")
	int unfixMatch(int matchSeq);

	
	//메인페이지
	//최신순
	@Select(  " SELECT m.*, s.SPO_NAME, FAC_NAME, "
			+ "(SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m, SPORTS s, FACILITY f "
			+ " WHERE m.SPO_ID = s.SPO_ID AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE AND MATCH_STATUS='N' AND f.FAC_SEQ=m.FAC_SEQ "
			+ " GROUP BY m.MATCH_SEQ "
			+ " ORDER BY "
			+ " m.MATCH_SEQ ASC limit 4 ")
	List<MatchDto> selectMainList();
	//카테고리
	@Select( "SELECT m.*, NICKNAME, s.SPO_NAME, "
			+ "	(SELECT COUNT(r.REP_SEQ) "
			+ "		FROM REPLY r "
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ " (SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m "
			+ " 	LEFT OUTER JOIN SPORTS s ON m.SPO_ID=s.SPO_ID "
			+ "		LEFT OUTER JOIN MEMBER mb ON m.ID=mb.ID "
			+ " WHERE m.SPO_ID = s.SPO_ID AND m.SPO_ID = #{spoId} AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE "
			+ " GROUP BY m.MATCH_SEQ"
			+ " ORDER BY "
			+ " CNT_JOIN DESC limit 4 ")
	List<MatchDto> selectMainSports(int spoId);
	//참여자 수 많은 순
	@Select( {"<script>"
			+ " SELECT m.*, s.SPO_NAME,  "
			+ "(SELECT COUNT(r.REP_SEQ) "
			+ "		FROM REPLY r"
			+ "		WHERE m.MATCH_SEQ=r.MATCH_SEQ) CNT_COMMENT, "
			+ "(SELECT COUNT(j.JOIN_SEQ) + 1 "
			+ "		FROM MATCH_JOIN j "
			+ "		WHERE m.MATCH_SEQ=j.MATCH_SEQ) CNT_JOIN "
			+ " FROM MATCH_BOARD m "
			+ " 	LEFT OUTER JOIN SPORTS s ON m.SPO_ID=s.SPO_ID "
			+ " <where>"
			+ " m.SPO_ID = s.SPO_ID AND MATCH_REGDATE BETWEEN MATCH_REGDATE AND MATCH_ENDDATE AND MATCH_STATUS='N' "
			+ " 	<if test='mspoId != null'>AND m.SPO_ID=#{spoId} </if> "
			+ " </where> "
			+ " GROUP BY m.MATCH_SEQ "
			+ " ORDER BY "
			+ " CNT_JOIN DESC limit 4 "
			+ " </script>"})
	List<MatchDto> selectMainHot(Integer mspoId);
	
	
	
	
}