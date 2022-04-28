package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.domain.NovelVO;
import com.ict.domain.PageMaker;
import com.ict.domain.SearchCriteria;
import com.ict.service.NovelService;

@Controller
@RequestMapping("/novel")
public class NovelController {
	
	@Autowired
	private NovelService service;
	
	@GetMapping(value="/boardList")

	public String getAllList(SearchCriteria cri, Model model) {
		
		List<NovelVO> novelList = service.novelList(cri);
		model.addAttribute("novelList",novelList);
		
		// 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); 
		int countPage = service.countPageNum(cri);
		pageMaker.setTotalBoard(countPage); 
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/boardList";
	}
	
	
	
}
