package com.novel.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.FreeRecVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;
import com.novel.free.mapper.FreeNovelMapper;
import com.novel.free.mapper.FreeReplyMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
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
		System.out.println("증가전 vo : " + vo);
		System.out.println("조회수 증가 전 :" + vo.getFree_hit());
		vo.setFree_hit(vo.getFree_hit()+1);
		System.out.println("증가후 vo : " + vo);
		System.out.println("조회수 증가 확인 : "+ vo.getFree_hit());
		freeMapper.addhit(vo);
		
	}

	@Override
	public List<FreeRecVO> selectRecList(long free_num){
	
		return freeMapper.selectRecList(free_num);
	}
	
	@Transactional
	@Override
	public void insertRec(FreeRecVO vo) {
		vo.setFree_rec(vo.getFree_rec() + 1);
		
		freeMapper.addRec(vo); 
		
		
		freeMapper.insertRec(vo);
		
		
		
	}
	
	@Transactional
	@Override
	public void deleteRec(FreeRecVO vo) {
		vo.setFree_rec(vo.getFree_rec() - 1);
		
		freeMapper.subtractRec(vo);	
			
		freeMapper.deleteRec(vo);
			
			
		
	}


}
