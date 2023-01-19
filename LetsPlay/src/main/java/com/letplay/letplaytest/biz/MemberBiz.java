package com.letplay.letplaytest.biz;

import java.util.List;

import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;

public interface MemberBiz {
	
	public MemberDto login(MemberDto dto);					//로그인
	public MemberDto selectmember(String id);				//회원정보 가져오기
	public int insert(MemberDto dto);						//회원가입
	public int idcheck(String id);							//아이디중복확인
	public String findid(String name, String phone);		//아이디찾기
	
	public String sendRandomMessage(String tel);
	public int memberTelCount(String tel);
	public int update(MemberDto dto);
	public int delete(String id);
	
	public List<FacResDto> selectResfac(String id);			//시설예약내역불러오기
	public List<LessonResDto> selectResles(String id);		//레슨예약내역불러오기
	public List<ReviewDto> selectmyreview(String id);		//후기불러오기
	public int nicknamecheck(String nickname);

	
	public List<FacDto> selectLikesfac(String id);			//시설찜내역 불러오기
	public List<LessonDto> selectLikesles(String id);		//레슨찜내역 불러오기
	//public List<MatchDto> selectLikesmath(String id);		//매치찜내역 불러오기
}
