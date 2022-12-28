package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.InquiryMapper;
import com.letplay.letplaytest.dto.Criteria;
import com.letplay.letplaytest.dto.InquiryDto;

@Service
public class InquiryImpl implements InquiryBiz{
	
	@Autowired
	private InquiryMapper inquiryMapper;

	@Override
	public List<InquiryDto> selectList(Criteria criteria) {
		return inquiryMapper.selectList(criteria);
	}

	@Override
	public InquiryDto selectOne(int inqSeq) {
		return inquiryMapper.selectOne(inqSeq);
	}

	@Override
	public int insert(InquiryDto dto) {
		return inquiryMapper.insert(dto);
	}

	@Override
	public int update(InquiryDto dto) {
		return inquiryMapper.update(dto);
	}

	@Override
	public int delete(int inqSeq) {
		return inquiryMapper.delete(inqSeq);
	}

	@Override
	public int getTotal() {
		return inquiryMapper.getTotal();
	}

}
