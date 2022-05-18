package com.novel.paid.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.service.PaidNovelService;

@Controller
@RequestMapping("/paid")
public class PaidNovelController {
	
	@Autowired
	private PaidNovelService paidservice;
	
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
		
		List<PaidVO> paidList = paidservice.selectPaidList(getPaidList());
		model.addAttribute("paidList" ,paidList);
		
		return "paid/paidsList";
	}
	
	// ■ 유료소설 회자 상세 (paidDetail)
	@GetMapping("/detail/{novel_num}/{paid_num}")
	public String getPaidDetail(@PathVariable long novel_num, @PathVariable long paid_num, Model model ) {
		PaidVO novel = paidservice.selectDetail(paid_num, novel_num);
		model.addAttribute("novel",novel);
		
		return "paid/paidDetail";
	}
	

}
