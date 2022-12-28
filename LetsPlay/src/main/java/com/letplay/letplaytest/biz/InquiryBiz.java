package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.InquiryDto;

public interface InquiryBiz {
	public List<InquiryDto> selectList(Criteria criteria);		//전체 문의리스트 불러오기
	public InquiryDto selectOne(int inqSeq);	//문의디테일
	public int insert(InquiryDto dto);			//문의등록
	public int update(InquiryDto dto);			//문의수정
	public int delete(int inqSeq);				//문의삭제
	public int getTotal();	//전체 데이터갯수 가져오기
}
