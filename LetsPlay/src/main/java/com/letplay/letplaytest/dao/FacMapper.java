package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;

@Mapper
public interface FacMapper {
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_DATE "
			+ " FROM FACILITY, SPORTS "
			+ " WHERE FACILITY.SPO_ID = SPORTS.SPO_ID ")
	List<FacDto> selectFacList();
	
	@Select(" SELECT FAC_SEQ, FAC_NAME, SPO_NAME, FAC_LOCATION, FAC_IMG, FAC_DATE "
			+ " FROM FACILITY f, SPORTS s "
			+ " WHERE f.SPO_ID = #{spoId} AND f.SPO_ID = s.SPO_ID ")
	List<FacDto> selectSports(int spoId);
	
	@Select(" SELECT FAC_SEQ, FAC_NAME, FACILITY.SPO_ID, SPO_NAME, FAC_LOCATION, FAC_CONTACT, FAC_IMG, FAC_COST, FAC_DATE, FAC_PARKING, FAC_LENT, FAC_SHOWER, FAC_LOCKER, FAC_LIGHT, FAC_COSTCHECK "
			+ " FROM FACILITY, SPORTS\n"
			+ " WHERE FAC_SEQ = #{facSeq} AND FACILITY.SPO_ID = SPORTS.SPO_ID ")
	FacDto selectFac(int facSeq);
	
	@Delete(" DELETE FROM FACILITY WHERE FAC_SEQ = #{facSeq} ")
	int deleteFac(int facSeq);
	
	@Insert(" INSERT INTO `FACILITY` VALUES(NULL, #{facName}, #{spoId}, #{facLocation}, #{facContact}, #{facImg}, #{facCost}, NOW(), #{facParking}, #{facLent}, #{facShower}, #{facLocker}, #{facLight}, #{facCostcheck}) ")
	int insertFac(FacDto dto);
	
	@Update(" UPDATE `FACILITY` "
			+ " SET SPO_ID=#{spoId}, FAC_NAME=#{facName}, FAC_LOCATION=#{facLocation}, FAC_CONTACT=#{facContact}, FAC_IMG=#{facImg}, FAC_COST=#{facCost}, FAC_PARKING=#{facParking}, FAC_LENT=#{facLent}, FAC_SHOWER=#{facShower}, FAC_LOCKER=#{facLocker}, FAC_LIGHT=#{facLight}, FAC_COSTCHECK=#{facCostcheck} "
			+ " WHERE FAC_SEQ=#{facSeq} ")
	int updateFac(FacDto dto);
	
	//시설예약
	@Insert(" INSERT INTO `FACILITY_RESERVATION` VALUES(#{resId}, #{id}, #{facSeq}, #{resDate}, #{resStarttime}, NULL, #{resPrice} )")
	int insertRes(FacResDto dto);
	
//	@Select("SELECT NAME, NICKNAME, PHONE, EMAIL, RES_DATE, RES_PRICE, RES_STARTTIME, RES_ENDTIME, FAC_IMG, FAC_NAME, FAC_LOCATION, FAC_CONTACT "
//			+ " FROM ( "
//			+ "	SELECT r.`ID` AS r_id, m.`ID` AS m_id, r.FAC_SEQ AS r_seq, f.FAC_SEQ AS f_seq, NAME, NICKNAME, PHONE, EMAIL, RES_DATE, RES_STARTTIME, RES_ENDTIME, RES_PRICE, FAC_IMG, FAC_NAME, FAC_LOCATION, FAC_CONTACT "
//			+ "	FROM `FACILITY_RESERVATION` r, `MEMBER` m, `FACILITY` f "
//			+ "	WHERE r.ID=m.ID AND r.FAC_SEQ=f.FAC_SEQ "
//			+ "	) TMP "
//			+ " WHERE r_seq=#{facSeq} AND r_id=#{id} AND RES_DATE=#{resDate} AND RES_STARTTIME=#{resStarttime}; ")
//	FacResDto selectRes(int facSeq, String id, Date resDate, String resStarttime);
}
