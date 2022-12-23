package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.FacDto;

@Mapper
public interface FacMapper {
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_DATE\n"
			+ " FROM FACILITY, SPORTS\n"
			+ " WHERE FAC_SEQ = ${facSeq} AND FACILITY.SPO_ID = SPORTS.SPO_ID ")
	List<FacDto> selectFacLisit();
	
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_COST, FAC_DATE, FAC_PARKING, FAC_LENT, FAC_SHOWER, FAC_LOCKER, FAC_LIGHT\n"
			+ " FROM FACILITY, SPORTS\n"
			+ " WHERE FAC_SEQ = #{facSeq} AND FACILITY.SPO_ID = SPORTS.SPO_ID ")
	FacDto selectFac(int facSeq);
	
	@Delete(" DELETE FROM FACILITY WHERE FAC_SEQ = #{facSeq} ")
	int delete(int facSeq);
}
