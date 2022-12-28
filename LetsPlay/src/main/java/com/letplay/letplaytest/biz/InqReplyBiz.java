package com.letplay.letplaytest.biz;

import com.letplay.letplaytest.dto.InqReplyDto;

public interface InqReplyBiz {
	public InqReplyDto select(int inqSeq);
	public int insert(InqReplyDto dto);
	public int update(InqReplyDto dto);
	public int delete(int repSeq);
}
