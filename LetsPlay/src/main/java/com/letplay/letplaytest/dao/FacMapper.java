package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;

@Mapper
public interface FacMapper {
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_DATE\n"
			+ " FROM FACILITY, SPORTS\n"
			+ " WHERE FACILITY.SPO_ID = SPORTS.SPO_ID ")
	List<FacDto> selectFacList();
	
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_COST, FAC_DATE, FAC_PARKING, FAC_LENT, FAC_SHOWER, FAC_LOCKER, FAC_LIGHT\n"
			+ " FROM FACILITY, SPORTS\n"
			+ " WHERE FAC_SEQ = #{facSeq} AND FACILITY.SPO_ID = SPORTS.SPO_ID ")
	FacDto selectFac(int facSeq);
	
	@Delete(" DELETE FROM FACILITY WHERE FAC_SEQ = #{facSeq} ")
	int delete(int facSeq);
	
	@Insert(" INSERT INTO `FACILITY_RESERVATION` VALUES(NULL, #{id}, #{facSeq}, #{resDate}, #{resStarttime}, #{resEndtime}, #{resPrice} )")
	int insertRes(FacResDto dto);
	
	@Select(" SELECT * FROM `FACILITY_RESERVATION` WHERE RES_ID=#{resId} ")
	FacResDto selectRes(int resId);
}
