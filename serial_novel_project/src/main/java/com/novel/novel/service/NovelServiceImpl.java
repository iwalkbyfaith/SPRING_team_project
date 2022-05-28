package com.novel.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.novel.domain.MainBestNovelVO;
import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;
import com.novel.novel.mapper.NovelMapper;

@Service
public class NovelServiceImpl implements NovelService{

	@Autowired
	private NovelMapper novelMapper;
	
	
	@Override
	public List<NovelVO> getNovelList(SearchCriteria cri) {
		return novelMapper.getNovelList(cri);
	}

	@Override
	public void insertNovel(NovelVO vo) {
		novelMapper.insertNovel(vo);
	}

	@Override
	public void deleteNovel(long novel_num) {
		novelMapper.deleteNovel(novel_num);
		
	}

	@Override
	public NovelVO detailNovel(long novel_num) {
		return novelMapper.detailNovel(novel_num);
	}

	@Override
	public void updateNovel(NovelVO vo) {
		novelMapper.updateNovel(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return novelMapper.countPageNum(cri);
	}

	
	
	// ● 무료소설 조회수 베스트
	@Override
	public List<MainBestNovelVO> getBestViewFreeData() {
		return novelMapper.getBestViewFreeData();
	}

	// ● 무료소설 추천수 베스트
	@Override
	public List<MainBestNovelVO> getBestRecFreeData() {
		return novelMapper.getBestRecFreeData();
	}

	// ● 유료소설 조회수 베스트
	@Override
	public List<MainBestNovelVO> getBestViewPaidData() {
		return novelMapper.getBestViewPaidData();
	}

	// ● 유료소설 추천수 베스트
	@Override
	public List<MainBestNovelVO> getBestRecPaidData() {
		return novelMapper.getBestRecPaidData();
	}

	
	
}
