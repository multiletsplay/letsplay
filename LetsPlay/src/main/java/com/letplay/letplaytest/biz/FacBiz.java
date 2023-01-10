package com.letplay.letplaytest.biz;

import java.util.Date;
import java.util.List;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;

public interface FacBiz {
	public List<FacDto> selectFacList();	//전체 시설 불러오기
	public List<FacDto> selectSports(int spoId);		//선택 스포츠시설 불러오기
	public FacDto selectFac(int facSeq); 	//시설 디테일
	public int deleteFac(int facSeq);			//시설 삭제
	public int insertFac(FacDto dto);		//시설 등록
	public int updateFac(FacDto dto);		//시설 수정
	
	public int insertRes(FacResDto dto);	//예약 등록
	//public FacResDto selectRes(int facSeq, String id, Date resDate, String resStarttime);	//예약 상세확인
}
