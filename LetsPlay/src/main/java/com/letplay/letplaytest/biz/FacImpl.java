package com.letplay.letplaytest.biz;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.letplay.letplaytest.dao.FacMapper;
import com.letplay.letplaytest.dto.FacDto;
import com.letplay.letplaytest.dto.FacResDto;
import com.letplay.letplaytest.dto.SearchDto;
import com.letplay.letplaytest.dto.TimeDto;

@Service
public class FacImpl implements FacBiz{
	
	@Autowired
	private FacMapper facMapper;

	@Override
	public List<FacDto> selectFacList(String id) {
		return facMapper.selectFacList(id);
	}
	
	@Override
	public List<FacDto> searchFac(SearchDto dto) {
		return facMapper.searchFac(dto);
	}
	
	@Override
	public List<FacDto> selectSports(int spoId, String id) {
		return facMapper.selectSports(spoId, id);
	}
	
	@Override
	public FacDto selectFac(int facSeq) {
		return facMapper.selectFac(facSeq);
	}

	@Override
	public int deleteFac(int facSeq) {
		return facMapper.deleteFac(facSeq);
	}
	
	@Override
	public int insertFac(FacDto dto, MultipartFile file) throws Exception {
		String projpath = System.getProperty("user.dir")+"/src/main/webapp/image";
		UUID uuid = UUID.randomUUID();
		String filename = uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(projpath,filename);
		file.transferTo(saveFile);
		dto.setFacImg(filename);
		dto.setFacImgpath("/image/"+filename);
		return facMapper.insertFac(dto);
	}
	
	@Override
	public int updateFac(FacDto dto) {
		return facMapper.updateFac(dto);
	}

	@Override
	public int insertRes(FacResDto dto) {
		return facMapper.insertRes(dto);
	}

	@Override
	public List<TimeDto> selectTime(int facSeq) {
		return facMapper.selectTime(facSeq);
	}

	@Override
	public int cancelres(String resId) {
		return facMapper.cancelRes(resId);
	}

	@Override
	public List<FacDto> selectRateavg(Integer fspoId) {
		return facMapper.selectRateavg(fspoId);
	}

}
