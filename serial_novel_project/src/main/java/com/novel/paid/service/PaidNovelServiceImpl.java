package com.novel.paid.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.paid.domain.PaidFavVO;
import com.novel.paid.domain.PaidRecVO;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;
import com.novel.paid.mapper.PaidNovelMapper;
import com.novel.paid.mapper.PaidReplyMapper;


@Service
public class PaidNovelServiceImpl implements PaidNovelService{
	
	@Autowired
	private PaidNovelMapper paidMapper;
	
	@Autowired
	private PaidReplyMapper replyMapper;


	@Override
	public PaidVO selectDetail(long paidNum, long novelNum) {
		return paidMapper.selectDetail(paidNum,novelNum);
	}

	@Override
	public PaidVO detailCon(long paidNum) {
		return paidMapper.detailCon(paidNum);
	}


	@Override
	public List<PaidVO> selectPaidList(long novelNum) {
		return paidMapper.selectPaidList(novelNum);
	}

	@Override
	public void insert(PaidVO vo) {
		paidMapper.insert(vo);
		
	}
	
	@Override
	public void delete(long paid_num) {
		paidMapper.delete(paid_num);
		
	}

	@Override
	public void update(PaidVO vo) {
		paidMapper.update(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri, long novelNum) {
		return paidMapper.countPageNum(cri, novelNum);
	}

	@Override
	public void upHit(long paid_num) {
		paidMapper.upHit(paid_num);
		
	}

	@Override
	public void addRec(PaidRecVO vo) {
		paidMapper.addRec(vo);
		
	}

	@Override
	public void plusRec(long paid_num) {
		paidMapper.plusRec(paid_num);
		
	}

	@Override
	public PaidRecVO recList(long paid_num, long user_num) {
		return paidMapper.recList(paid_num, user_num);
	}

	@Override
	public List<PaidVO> selectMon(SearchCriteria cri) {
		return paidMapper.selectMon(cri);
	}

	@Override
	public List<PaidVO> selectTue(SearchCriteria cri) {
		return paidMapper.selectTue(cri);
	}

	@Override
	public List<PaidVO> selectWed(SearchCriteria cri) {
		return paidMapper.selectWed(cri);
	}

	@Override
	public List<PaidVO> selectThu(SearchCriteria cri) {
		return paidMapper.selectThu(cri);
	}

	@Override
	public List<PaidVO> selectFri(SearchCriteria cri) {
		return paidMapper.selectFri(cri);
	}

	@Override
	public void addFav(PaidFavVO vo) {
		paidMapper.addFav(vo);
		
	}

	@Override
	public void delFav(long novel_num, long user_num) {
		paidMapper.delFav(novel_num, user_num);	
	}

	@Override
	public PaidFavVO favList(long novelNum, String user_id) {
		return paidMapper.favList(novelNum, user_id);
	}

	@Override
	public long getUserNumber(String user_id) {
		return paidMapper.getUserNumber(user_id);
	}





	
}
