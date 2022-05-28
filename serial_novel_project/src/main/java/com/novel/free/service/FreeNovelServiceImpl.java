package com.novel.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;
import com.novel.free.mapper.FreeNovelMapper;
import com.novel.free.mapper.FreeReplyMapper;


@Service
public class FreeNovelServiceImpl implements FreeNovelService{
	
	@Autowired
	private FreeNovelMapper freeMapper;
	@Autowired
	private FreeReplyMapper replyMapper;

	@Override
	public List<NovelVO> selectList(String novelCategory){
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
	
	@Transactional
	@Override
	public void delete(long freeNum) {
		replyMapper.deleteAll(freeNum);
		
		freeMapper.delete(freeNum);
		
	}

	@Override
	public void update(FreeNovelVO vo) {
			freeMapper.update(vo);
		
	}
	
	@Override
	public void addhit (FreeNovelVO vo) {
		vo.setFree_hit(vo.getFree_hit()+1);
		freeMapper.addhit(vo);
		
	}



}
