package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.domain.FreeNovelVO;
import com.ict.domain.PageMaker;
import com.ict.domain.SearchCriteria;
import com.ict.service.FreeNovelService;

import lombok.extern.log4j.Log4j;

@Controller

@Service
@Log4j
@RequestMapping("/free")
public class FreeNovelController {
	
	@Autowired
	private FreeNovelService service;
	
	@GetMapping(value="/novelList")
	
	public String novelList(SearchCriteria cri,Model model) {
		List<FreeNovelVO> novelList = service.getList(cri);
		model.addAttribute("novelList",novelList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int countPage = service.countPageNum(cri);
		pageMaker.setTotalBoard(countPage);
		model.addAttribute("pageMaker",pageMaker);
		
		return "free/novelList";
		
		
				
		
		
	}
	

}
