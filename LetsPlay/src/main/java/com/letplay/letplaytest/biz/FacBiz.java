package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;

public interface FacBiz {
	public List<FacDto> selectFacList();	//전체 시설 불러오기
	public FacDto selectFac(int facSeq); 	//시설 디테일
	public int delete(int facSeq);			//시설 삭제
	
	public int insertRes(FacResDto dto);	//예약 등록
	public FacResDto selectRes(int resId);	//예약 상세확인
}
