package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.NoticeDto;
/*`NOTICE_SEQ`	int unsigned auto_increment	NOT NULL,
	`ID`	VARCHAR(300)	NOT NULL,
	`NOTICE_TITLE`	VARCHAR(50)	NOT NULL,
	`NOTICE_CONTENT`	VARCHAR(1000)	NOT NULL,
	`NOTICE_DATE`	DATE	NOT NULL,
	`NOTICE_MODIDATE`	DATE	NULL*/
@Mapper
public interface NoticeMapper {
//	@Select("SELECT *  FROM NOTICE ORDER BY NOTICE_SEQ DESC ")
	@Select(" SELECT NOTICE_SEQ, ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_MODIDATE\n"
			+ "FROM (\n"
			+ "	SELECT @ROWNUM := @ROWNUM + 1 AS rnum, NOTICE_SEQ, ID, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_MODIDATE\n"
			+ "	FROM `NOTICE` N, (SELECT @ROWNUM := 0 ) A\n"
			+ "	ORDER BY NOTICE_SEQ DESC\n"
			+ ") TMP\n"
			+ "WHERE rnum > (#{pageNum } - 1) * #{amount} \n"
			+ "LIMIT #{amount } ")
	List<NoticeDto> selectNoticeList(Criteria criteria);

	@Select("SELECT * FROM NOTICE WHERE NOTICE_SEQ=#{noticeSeq} ")
	NoticeDto selectNoticeOne(int inqSeq);
	
	@Insert(" INSERT INTO `multi`.`notice` (`NOTICE_SEQ`, `ID`, `NOTICE_TITLE`, `NOTICE_CONTENT`, `NOTICE_DATE`, `NOTICE_MODIDATE`) VALUES (NULL, #{id}, #{noticeTitle}, #{noticeContent}, now(), now()) ")
	int insertNotice(NoticeDto dto);
	
	@Update("UPDATE NOTICE SET NOTICE_TITLE=#{noticeTitle}, NOTICE_CONTENT=#{noticeContent} WHERE NOTICE_SEQ=#{noticeSeq} ")
	int updateNotice(NoticeDto dto);
	
	@Delete("DELETE FROM NOTICE WHERE NOTICE_SEQ=#{noticeSeq} ")
	int deleteNotice(int noticeSeq);

	@Select(" SELECT count(*) FROM `NOTICE` ")
	int getTotal();


}

