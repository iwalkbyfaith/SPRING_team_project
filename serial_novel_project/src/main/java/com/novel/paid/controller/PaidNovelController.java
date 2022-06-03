package com.novel.paid.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.charge.domain.UseVO;
import com.novel.charge.service.ChargeService;
import com.novel.novel.domain.NovelVO;
import com.novel.novel.service.NovelService;
import com.novel.paid.domain.PageMaker;
import com.novel.paid.domain.PaidFavVO;
import com.novel.paid.domain.PaidRecVO;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;
import com.novel.paid.mapper.PaidNovelMapper;
import com.novel.paid.service.PaidNovelService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/paid")
@Log4j
public class PaidNovelController {
	
	@Autowired
	private PaidNovelService paidservice;
	
	@Autowired
	private NovelService novelservice;
	
	@Autowired
	private ChargeService chargeservice;
	
	
	// 인증된 사용자 전용
	// ■ 각 요일별(월~금)로 데이터 가져오기 - paidList.jsp
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/novelList")
	public String getPaidList(SearchCriteria cri,Model model) {
		
		List<PaidVO> monList = paidservice.selectMon(cri);
		model.addAttribute("monList", monList);
		
		List<PaidVO> tueList = paidservice.selectTue(cri);
		model.addAttribute("tueList", tueList);
		
		List<PaidVO> wedList = paidservice.selectWed(cri);
		model.addAttribute("wedList", wedList);
		
		List<PaidVO> thuList = paidservice.selectThu(cri);
		model.addAttribute("thuList", thuList);
		
		List<PaidVO> friList = paidservice.selectFri(cri);
		model.addAttribute("friList", friList);
		
		return "paid/paidList";
	}
	
	
	
	
	
	// ■ 해당 유료소설의 상세회차들 - paidsList.jsp
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/List/{novelNum}")
	public String paidList(@PathVariable("novelNum") long novelNum, Principal principal, Model model) {
		
		NovelVO novelList = novelservice.detailNovel(novelNum); // 소설의 디테일한 정보
		
		List<PaidVO> paidList = paidservice.selectPaidList(novelNum); // 소설에 해당된 유료소설리스트
		
		
		model.addAttribute("novelNum", novelNum);
		model.addAttribute("paidList", paidList);
		model.addAttribute("novelList", novelList);
		
		String user_id = principal.getName(); // 유저 네임으로 아이디에 저장
		
		PaidFavVO fav = paidservice.favList(novelNum, user_id); // 선호작 리스트
		model.addAttribute("fav", fav);
		
		return "paid/paidsList";
	}
	
	// ■ 유료소설 회자 상세 paidDetail.jsp
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detail/{novel_num}/{paid_num}/{user_num}")
	public String getPaidDetail(@PathVariable long novel_num, @PathVariable long paid_num, 
			@PathVariable long user_num, Model model ) {
		
		paidservice.upHit(paid_num); // 조회수 증감
		PaidVO novel = paidservice.selectDetail(paid_num, novel_num); // 유료소설 디테일
		model.addAttribute("novel",novel);
		
		PaidRecVO rec = paidservice.recList(paid_num, user_num); // 추천테이블 조회
		model.addAttribute("rec",rec);
		
		UseVO use = chargeservice.useList(paid_num, user_num); // 구매리스트 조회
		model.addAttribute("use",use);
		
		return "paid/paidDetail";
	}
	
	// ■ 유료소설 상세 페이지 폼 - paidSfrom.jsp 로 이동시킴
	@GetMapping("/insertS/{novelNum}")
	public String insertS(@PathVariable long novelNum, Model model) {
		
		NovelVO novel = novelservice.detailNovel(novelNum);
		
		model.addAttribute("novel", novel);
		return "paid/paidSform";
	}
	
	// ■ 유료소설 상세 소설 작성 - paidSform.jsp
	@PostMapping("/insertS")
	public String insertS(PaidVO paidvo) {
		paidservice.insert(paidvo);
		return "redirect:/paid/List/" + paidvo.getNovel_num();
	}
	
	// ■ 유료소설 회차 삭제 - paidDetail.jsp
	@PostMapping("/DeleteS")
	public String deleteS(long paid_snum, long novel_num) {
		paidservice.delete(paid_snum);
		return "redirect:/paid/List/" + novel_num; 
	}
	
	// ■ 유료소설 상세 수정페이지 폼 - paidUform.jsp
	@PostMapping(value="/updateS")
	public String updateForm(long novel_num, long paid_num, Model model) {
		PaidVO vo = paidservice.selectDetail(paid_num, novel_num);
		model.addAttribute("vo", vo);
		return "paid/paidUform";
	}
	
	// ■ 유료소설 회차 수정 - paidUform.jsp
	@PostMapping("/paidUpdate")
	public String updateS(PaidVO vo, long novel_num){
		paidservice.update(vo);
	return "redirect:/paid/novelList/";
	}
}

