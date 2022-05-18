package com.novel.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;
import com.novel.free.mapper.FreeNovelMapper;


@Service
public class FreeNovelServiceImpl implements FreeNovelService{
	
	@Autowired
	private FreeNovelMapper freeMapper;

	@Override
	public List<FreeNovelJoinVO> selectList(String novelCategory){
			return freeMapper.selectList(novelCategory);
	}
	
	@Override
	public List<FreeNovelJoinVO> getList(SearchCriteria cri) {
	
		return freeMapper.getJoinList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		
		return freeMapper.countPageNum(cri);
	}

	@Override
	public List<FreeNovelJoinVO> selectDetail(long freeSNum , long novelNum) {

		return freeMapper.selectDetail(freeSNum , novelNum);
	}
	@Override
	public List<FreeNovelJoinVO> select(long novelNum) {
		
		return freeMapper.select(novelNum);
	}
	@Override
	public List<NovelVO> selecttitle(long novelNum) {
		
		return freeMapper.selecttitle(novelNum);
	}

	@Override
	public void insertNovel(NovelVO vo) {
			freeMapper.insertNovel(vo);
		
	}

	@Override
	public void insertFree(FreeNovelVO vo) {
			freeMapper.insertFree(vo);
			
		
	}
	
	@Override
	public void delete(long freeNnum) {
			freeMapper.delete(freeNnum);
		
	}

	@Override
	public void update(FreeNovelVO vo) {
			freeMapper.update(vo);
		
	}



}
