package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;

public interface MemberBiz {
	
	public MemberDto login(MemberDto dto);					//로그인
	public MemberDto selectmember(String id);				//회원정보 가져오기
	public int insert(MemberDto dto);						//회원가입
	public int idcheck(String id);
	public String findid(String name, String phone);		//아이디찾기
	public List<ReviewDto> selectmyreview(String id);		//후기불러오기
	public String sendRandomMessage(String tel);
	public int memberTelCount(String tel);
	public int update(MemberDto dto);
	public int delete(String id);
}
