package com.letplay.letplaytest.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.letplay.letplaytest.dao.InqReplyMapper;
import com.letplay.letplaytest.dto.InqReplyDto;

@Service
public class InqReplyImpl implements InqReplyBiz{
	
	@Autowired
	private InqReplyMapper repmapper;
	
	@Override
	public InqReplyDto select(int inqSeq) {
		return repmapper.select(inqSeq);
	}

	@Override
	public int insert(InqReplyDto dto) {
		return repmapper.insert(dto);
	}

	@Override
	public int update(InqReplyDto dto) {
		return repmapper.update(dto);
	}

	@Override
	public int delete(int repSeq) {
		return repmapper.delete(repSeq);
	}

}
