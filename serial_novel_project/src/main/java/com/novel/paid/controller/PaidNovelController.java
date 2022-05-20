package com.novel.paid.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.service.NovelService;
import com.novel.paid.domain.PageMaker;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;
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
	
	@GetMapping(value="/novelList")
	public String getPaidList() {
		
		return "paid/paidList";
	}
	
	// ■ 요일별 소설 목록 (paidWeek)
	@GetMapping(value="/Week/{novelWeek}")
	public String paidWeek(@PathVariable("novelWeek") String novelWeek, Model model) {
		
		List<PaidVO> weekList = paidservice.selectWeekList(novelWeek);
		model.addAttribute("weekList", weekList);
		
		return "paid/paidWeek";
	}
	
	//
	@GetMapping(value="/List/{novelNum}")
	public String paidList(@PathVariable("novelNum") long novelNum, Model model) {
		
		
		List<PaidVO> paidList = paidservice.selectPaidList(novelNum);
		
		model.addAttribute("novelNum", novelNum);
		model.addAttribute("paidList", paidList);

		
		return "paid/paidsList";
	}
	
	// ■ 유료소설 회자 상세 (paidDetail)
	@GetMapping("/detail/{novel_num}/{paid_num}")
	public String getPaidDetail(@PathVariable long novel_num, @PathVariable long paid_num, Model model ) {
		PaidVO novel = paidservice.selectDetail(paid_num, novel_num);
		model.addAttribute("novel",novel);
		
		return "paid/paidDetail";
	}
	
	// ■ 유료소설 상세 페이지 폼
	@GetMapping("/insertS/{novelNum}")
	public String insertS(@PathVariable long novelNum, Model model) {
		
		NovelVO novel = novelservice.detailNovel(novelNum);
		
		model.addAttribute("novel", novel);
		return "paid/paidSform";
	}
	
	// ■ 유료소설 상세 소설 작성
	@PostMapping("/insertS")
	public String insertS(PaidVO paidvo) {
		paidservice.insert(paidvo);
		return "redirect:/paid/List/" + paidvo.getNovel_num();
	}
	
	// ■ 유료소설 회차 삭제
	@PostMapping("/DeleteS")
	public String deleteS(long paid_snum, long novel_num) {
		paidservice.delete(paid_snum);
		return "redirect:/paid/List/" + novel_num; 
	}
	
	// ■ 유료소설 상세 수정페이지 폼
	@PostMapping(value="/updateS")
	public String updateForm(long novel_num, long paid_num, Model model) {
		PaidVO vo = paidservice.selectDetail(paid_num, novel_num);
		model.addAttribute("vo", vo);
		return "paid/paidUform";
	}
	
	// ■ 유료소설 회차 수정
	@PostMapping("/paidUpdate")
	public String updateS(PaidVO vo, long novel_num){
		paidservice.update(vo);
	return "redirect:/paid/detail/" + novel_num + "/" + vo.getPaid_num();
	}
}
