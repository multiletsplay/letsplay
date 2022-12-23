package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.FacDto;

public interface FacBiz {
	public List<FacDto> selectFacList();	//전체 시설 불러오기
	public FacDto selectFac(int facSeq); 	//시설 디테일
	public int delete(int facSeq);			//시설 삭제
}
