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
import com.letplay.letplaytest.dto.TimeDto;

@Mapper
public interface FacMapper {
	
	@Select(" SELECT f.*, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, COUNT(REV_ID) CNT_REVIEW, AVG(REV_RATE) AS AVG_RATE "
			+ " FROM FACILITY f "
			+ "		LEFT OUTER JOIN SPORTS s ON f.SPO_ID=s.SPO_ID "
			+ " 	LEFT OUTER JOIN LIKES l ON f.FAC_SEQ=l.FAC_SEQ AND l.ID=#{id} "
			+ "		LEFT OUTER JOIN REVIEW r ON f.FAC_SEQ=r.FAC_SEQ "
			+ " GROUP BY f.FAC_SEQ "
			+ " ORDER BY f.FAC_DATE DESC ")
	List<FacDto> selectFacList(String id);
	
	@Select(" SELECT f.*, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, COUNT(REV_ID) CNT_REVIEW, AVG(REV_RATE) AS AVG_RATE "
			+ " FROM FACILITY f "
			+ "		LEFT OUTER JOIN SPORTS s ON f.SPO_ID=s.SPO_ID "
			+ " 	LEFT OUTER JOIN LIKES l ON f.FAC_SEQ=l.FAC_SEQ AND l.ID=#{id} "
			+ "		LEFT OUTER JOIN REVIEW r ON f.FAC_SEQ=r.FAC_SEQ "
			+ " WHERE f.SPO_ID=#{spoId} "
			+ " GROUP BY f.FAC_SEQ "
			+ " ORDER BY f.FAC_DATE DESC ")
	List<FacDto> selectSports(int spoId, String id);
	
	@Select(" SELECT f.*, s.SPO_NAME  "
			+ " FROM FACILITY f, SPORTS s "
			+ " WHERE FAC_SEQ = #{facSeq} AND f.SPO_ID = s.SPO_ID ")
	FacDto selectFac(int facSeq);
	
	@Select(" SELECT DT, SUM(RES_STATUS) AS RES_STATUS "
			+ " FROM (SELECT d.DT, IF(d.DT = fr.RES_DATE, 1, 0) AS RES_STATUS "
			+ "		FROM DETM d LEFT OUTER JOIN FACILITY_RESERVATION fr ON fr.FAC_SEQ = #{facSeq} ) d "
			+ " GROUP BY DT ")
	List<TimeDto> selectTime(int facSeq);
	
	@Delete(" DELETE FROM FACILITY WHERE FAC_SEQ = #{facSeq} ")
	int deleteFac(int facSeq);
	
	@Insert(" INSERT INTO `FACILITY` VALUES(NULL, #{facName}, #{spoId}, #{facLocation}, #{facContact}, #{facImg}, #{facImgpath}, #{facCost}, NOW(), #{facParking}, #{facLent}, #{facShower}, #{facLocker}, #{facLight}, #{facCostcheck}, #{id} ) ")
	int insertFac(FacDto dto);
	
	@Update(" UPDATE `FACILITY` "
			+ " SET SPO_ID=#{spoId}, FAC_NAME=#{facName}, FAC_LOCATION=#{facLocation}, FAC_CONTACT=#{facContact}, FAC_IMG=#{facImg}, FAC_COST=#{facCost}, FAC_PARKING=#{facParking}, FAC_LENT=#{facLent}, FAC_SHOWER=#{facShower}, FAC_LOCKER=#{facLocker}, FAC_LIGHT=#{facLight}, FAC_COSTCHECK=#{facCostcheck} "
			+ " WHERE FAC_SEQ=#{facSeq} ")
	int updateFac(FacDto dto);
	
	//시설예약
	@Insert(" INSERT INTO `FACILITY_RESERVATION` VALUES(#{resId}, #{id}, #{facSeq}, #{resDatetime}, #{resPrice} )")
	int insertRes(FacResDto dto);
	
	//예약취소
	@Delete(" DELETE FROM FACILITY_RESERVATION WHERE RES_ID = #{resId} ")
	int cancelRes(String resId);
	
	@Select( {"<script>",
	" SELECT f.*, s.SPO_NAME, ANY_VALUE(l.LIKES_STATUS) LIKES_STATUS, COUNT(REV_ID) CNT_REVIEW ",
	" FROM FACILITY f ",
	"	LEFT OUTER JOIN (SELECT ANY_VALUE(DT) AS DT, FAC_SEQ, SUM(RES_STATUS) AS RES_STATUS ",
	"		FROM (SELECT d.DT, f.FAC_SEQ , ANY_VALUE(IF(d.DT = fr.RES_DATE , 1, 0)) AS RES_STATUS ",
	"		FROM (SELECT DT FROM DETM ",
	"		WHERE DATE_FORMAT(DT, '%Y-%m-%d') = DATE_FORMAT(#{searchDate}, '%Y-%m-%d')) d , FACILITY f ",
	"	LEFT OUTER JOIN FACILITY_RESERVATION fr ON fr.FAC_SEQ = f.FAC_SEQ) TMP\n",
	"	GROUP BY FAC_SEQ) TMP2 ON f.FAC_SEQ = TMP2.FAC_SEQ",
	"	LEFT OUTER JOIN SPORTS s ON f.SPO_ID=s.SPO_ID ",
	" 	LEFT OUTER JOIN LIKES l ON f.FAC_SEQ=l.FAC_SEQ AND l.ID=#{id} ",
	"	LEFT OUTER JOIN REVIEW r ON f.FAC_SEQ=r.FAC_SEQ ",
	" <where>",
	" 	<if test='searchRegion1 != null'>FAC_LOCATION LIKE CONCAT(#{searchRegion1},'%') </if> ",
	"	<if test='searchRegion2 != null'>AND FAC_LOCATION LIKE CONCAT('%',#{searchRegion2},'%') </if>",
	" 	<if test='searchDate != null '>AND RES_STATUS != 17 </if> ",
	" 	<if test='optParking == true '>AND FAC_PARKING=#{optParking} </if> ",
	" 	<if test='optLent == true'>AND FAC_LENT=#{optLent} </if> ",
	" 	<if test='optShower == true'>AND FAC_SHOWER=#{optShower} </if> ",
	" 	<if test='optLocker == true'>AND FAC_LOCKER=#{optLocker} </if> ",
	" 	<if test='optLight == true'>AND FAC_LIGHT=#{optLight} </if> ",
	" 	<if test='optCost != null and optCost.equals(\"T\")'>AND FAC_COSTCHECK=1 </if> ",
	" 	<if test='optCost != null and optCost.equals(\"F\")'>AND FAC_COSTCHECK=0 </if> ",
	" </where> ",
	" GROUP BY f.FAC_SEQ ",
	" </script>" })
	List<FacDto> searchFac(SearchDto dto);
	
	//평점 좋은 순으로 4개까지 불러오기
	@Select( {"<script>",
			" SELECT f.*, SPO_NAME, AVG(REV_RATE) AS AVG_RATE, COUNT(REV_ID) CNT_REVIEW ",
			" FROM FACILITY f ",
			"	LEFT OUTER JOIN SPORTS s ON f.SPO_ID=s.SPO_ID ",
			" LEFT OUTER JOIN REVIEW r ON f.FAC_SEQ=r.FAC_SEQ ",
			" <where>",
			" 	<if test='fspoId != null'>f.SPO_ID=#{spoId} </if> ",
			" </where> ",
			" GROUP BY FAC_SEQ ",
			" ORDER BY AVG_RATE DESC ",
			" LIMIT 4 ",
			" </script>" })
	List<FacDto> selectRateavg(Integer fspoId);
}
