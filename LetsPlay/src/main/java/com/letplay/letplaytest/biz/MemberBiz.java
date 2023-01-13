package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;

public interface MemberBiz {
	
	public MemberDto login(MemberDto dto);					//로그인
	public MemberDto selectmember(String id);				//회원정보 가져오기
	public int insert(MemberDto dto);						//회원가입
	public List<ReviewDto> selectmyreview(String id);		//후기불러오기
}
