package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.MemberMapper;
import com.letplay.letplaytest.dto.MemberDto;
import com.letplay.letplaytest.dto.ReviewDto;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDto> selectmyreview(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
