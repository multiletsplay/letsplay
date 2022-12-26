package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.NoticeDto;
/*`NOTICE_SEQ`	int unsigned auto_increment	NOT NULL,
	`ID`	VARCHAR(300)	NOT NULL,
	`NOTICE_TITLE`	VARCHAR(50)	NOT NULL,
	`NOTICE_CONTENT`	VARCHAR(1000)	NOT NULL,
	`NOTICE_DATE`	DATE	NOT NULL,
	`NOTICE_MODIDATE`	DATE	NULL*/
@Mapper
public interface NoticeMapper {
	
	@Select()
	List<NoticeDto> selectList();

}
