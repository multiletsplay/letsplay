package com.letplay.letplaytest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.SearchDto;

@Mapper
public interface FacMapper {
	@Select(" SELECT TMP.*, s.SPO_NAME "
			+ " FROM ( "
			+ "		SELECT f.*, l.LIKES_STATUS "
			+ " 	FROM FACILITY f "
			+ "		LEFT OUTER JOIN LIKES l "
			+ " 	ON f.FAC_SEQ=l.FAC_SEQ AND l.ID=#{id} )TMP, SPORTS s "
			+ " WHERE TMP.SPO_ID = s.SPO_ID ")
	List<FacDto> selectFacList(String id);
	
	@Select(" SELECT TMP.*, s.SPO_NAME "
			+ " FROM ( "
			+ "		SELECT f.*, l.LIKES_STATUS "
			+ " 	FROM FACILITY f "
			+ "		LEFT OUTER JOIN LIKES l "
			+ " 	ON f.FAC_SEQ=l.FAC_SEQ AND l.ID=#{id} )TMP, SPORTS s "
			+ " WHERE TMP.SPO_ID=#{spoId} AND TMP.SPO_ID = s.SPO_ID ")
	List<FacDto> selectSports(int spoId, String id);
	
	@Select(" SELECT f.*, s.SPO_NAME "
			+ " FROM FACILITY f, SPORTS s "
			+ " WHERE FAC_SEQ = #{facSeq} AND f.SPO_ID = s.SPO_ID ")
	FacDto selectFac(int facSeq);
	
	@Delete(" DELETE FROM FACILITY WHERE FAC_SEQ = #{facSeq} ")
	int deleteFac(int facSeq);
	
	@Insert(" INSERT INTO `FACILITY` VALUES(NULL, #{facName}, #{spoId}, #{facLocation}, #{facContact}, #{facImg}, #{facImgpath}, #{facCost}, NOW(), #{facParking}, #{facLent}, #{facShower}, #{facLocker}, #{facLight}, #{facCostcheck}) ")
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
	
	@Select( {"<script>",
		" SELECT f.*, s.SPO_NAME ",
		" FROM FACILITY f INNER JOIN SPORTS s ON f.SPO_ID = s.SPO_ID ",
		" WHERE ",
		" 	<if test='searchRegion1 != null'>FAC_LOCATION LIKE CONCAT(#{searchRegion1},'%') </if> ",
		"	<if test='searchRegion2 != null'>AND FAC_LOCATION LIKE CONCAT('%',#{searchRegion2},'%') </if>",
//		"	<if test='searchDate != null'>AND FAC_DATE=#{searchDate} </if>",
		" 	<if test='optParking == true '>AND FAC_PARKING=#{optParking} </if> ",
		" 	<if test='optLent == true'>AND FAC_LENT=#{optLent} </if> ",
		" 	<if test='optShower == true'>AND FAC_SHOWER=#{optShower} </if> ",
		" 	<if test='optLocker == true'>AND FAC_LOCKER=#{optLocker} </if> ",
		" 	<if test='optLight == true'>AND FAC_LIGHT=#{optLight} </if> ",
		" 	<if test='optCost == true'>AND FAC_COSTCHECK=#{optCost} </if> ",
		" 	<if test='optCost == false'>AND FAC_COSTCHECK=FALSE </if> ",
		" </script>" })
	List<FacDto> searchFac(SearchDto dto);
}
