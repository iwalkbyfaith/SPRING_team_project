package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.domain.NovelVO;
import com.ict.domain.PageMaker;
import com.ict.domain.SearchCriteria;
import com.ict.service.NovelService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/novel")
public class NovelController {
	
	@Autowired
	private NovelService service;
	
	@GetMapping(value="/novelList")
	public String getAllList(SearchCriteria cri, Model model) {
		
		List<NovelVO> novelList = service.getList(cri);
		model.addAttribute("novelList",novelList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); 
		int countPage = service.countPageNum(cri);
		pageMaker.setTotalBoard(countPage); 
		model.addAttribute("pageMaker", pageMaker);
		
		return "novel/novelList";
	}
	
	@GetMapping(value="/novelDetail/{novel_num}")
	public String getDetail(@PathVariable int novel_num, Model model) {
		NovelVO novel = service.select(novel_num);
		model.addAttribute("novel", novel);
		return "novel/novelDetail";
	}
	
	@GetMapping(value="/novelInsert")
	public String boardForm() {
		return "novel/novelForm";
	}
	
	@PostMapping(value="/novelInsert")
	public String boardInsert(NovelVO novelVO) {
		service.insert(novelVO);
		return "redirect:/novel/novelList";
	}
	
	@PostMapping(value="/novelDelete")
	public String boardDelete(int novel_num, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.delete(novel_num);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/novel/novelList";
	}
	
	@PostMapping(value="/novelUpdateForm")
	public String updateForm(int novel_num, Model model) {
		NovelVO novel = service.select(novel_num);
		model.addAttribute("novel", novel);
		return "novel/novelUpdateForm";
	}
	
	@PostMapping("/novelUpdate")
	public String boardUpdate(NovelVO novel, SearchCriteria cri, RedirectAttributes rttr){
	
	log.info("수정로직입니다." + novel);
	log.info("검색어 : " + cri.getKeyword());
	log.info("검색조건 : " + cri.getSearchType());
	log.info("페이지번호 : " + cri.getPageNum());
	service.update(novel);
	
	rttr.addAttribute("pageNum",cri.getPageNum());
	rttr.addAttribute("searchType",cri.getSearchType());
	rttr.addAttribute("keyword",cri.getKeyword());
	
	return "redirect:/novel/novelDetail/" + novel.getNovel_num();
	
	}
}
