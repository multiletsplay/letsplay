package com.letplay.letplaytest.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.FacMapper;
import com.letplay.letplaytest.dto.FacDto;

@Service
public class FacImpl implements FacBiz{
	
	@Autowired
	private FacMapper facMapper;

	@Override
	public List<FacDto> selectFacList() {
		return facMapper.selectFacList();
	}
	
	@Override
	public FacDto selectFac(int facSeq) {
		return facMapper.selectFac(facSeq);
	}

	@Override
	public int delete(int facSeq) {
		return facMapper.delete(facSeq);
	}

}
