package com.novel.paid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.paid.domain.PageMaker;
import com.novel.paid.domain.PaidNovelVO;
import com.novel.paid.domain.SearchCriteria;
import com.novel.paid.service.PaidNovelService;

@Controller
@RequestMapping("/paid")
public class PaidNovelController {
	
	@Autowired
	private PaidNovelService service;
	
	
	@GetMapping(value="/paidList")
	public String getAllList(SearchCriteria cri, Model model) {
		
		List<PaidNovelVO> paidList = service.getList(cri);
		model.addAttribute("paidList", paidList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int countPage = service.countPageNum(cri);
		pageMaker.setTotalBoard(countPage);
		model.addAttribute("pageMaker", pageMaker);
		
		return "paid/paidList";
	}
	
	@GetMapping("/paidInsert")
	public String paidForm() {
		return "paid/paidForm";
	}
	
	@PostMapping("/paidInsert")
	public String paidInsert(PaidNovelVO vo) {
		service.insert(vo);
		return "redirect:/paid/paidList";
	}
	
	
}
