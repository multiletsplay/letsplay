package com.letplay.letplaytest.biz;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.MemberMapper;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.LessonDto;
import com.letplay.letplaytest.dto.LessonResDto;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;
import com.letplay.letplaytest.util.Naver_Sens_V2;

@Service
public class Memberlmpl implements MemberBiz{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return memberMapper.login(dto);
	}
	
	@Override
	public MemberDto selectmember(String id) {
		return memberMapper.selectmember(id);
	}
	
	@Override
	public int insert(MemberDto dto) {
		return memberMapper.insert(dto);
	}
	
	@Override
	public int idcheck(String id) {
		return memberMapper.idcheck(id);
	}

	@Override
	public String findid(String name, String phone) {
		return memberMapper.findid(name, phone);
	}
	
	@Override
	public String sendRandomMessage(String tel) {
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(tel, numStr);

	    return numStr;
	}

	@Override
	public int memberTelCount(String tel) {
		return memberMapper.CountTel(tel);
	}

	@Override
	public int update(MemberDto dto) {
		return memberMapper.update(dto);
	}

	@Override
	public int delete(String id) {
		return memberMapper.delete(id);
	}

	@Override
	public List<FacResDto> selectResfac(String id) {
		return memberMapper.selectResfac(id);
	}
	
	@Override
	public List<LessonResDto> selectResles(String id) {
		return memberMapper.selectResles(id);
	}
	
	@Override
	public List<ReviewDto> selectmyreview(String id) {
		// TODO Auto-generated method stub
		return null;
	}

  @Override
	public int nicknamecheck(String nickname) {
		return memberMapper.nicknamecheck(nickname);
	}

	@Override
	public List<FacDto> selectLikesfac(String id) {
		return memberMapper.selectLikesfac(id);
	}
	
	@Override
	public List<LessonDto> selectLikesles(String id) {
		return memberMapper.selectLikesles(id);
	}

}
