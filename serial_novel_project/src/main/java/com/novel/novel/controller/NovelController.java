package com.novel.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.PageMaker;
import com.novel.novel.domain.SearchCriteria;
import com.novel.novel.service.NovelService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/novel")
public class NovelController {
	
	@Autowired
	private NovelService novelservice;

	@GetMapping(value="/allList")
	@GetMapping(value="/novelList")
	public String getNovelList(SearchCriteria cri, Model model) {
		List<NovelVO> novelList = novelservice.getNovelList(cri);
		model.addAttribute("novelList", novelList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); 
		int countPage = novelservice.countPageNum(cri);
		pageMaker.setTotalBoard(countPage);
		model.addAttribute("pageMaker", pageMaker);
		
		return "novel/novelList";
	}
	
	@GetMapping("/novelDetail/{novel_num}")
	public String getNovelDetail(@PathVariable long novel_num, Model model) {
		NovelVO novel = novelservice.detailNovel(novel_num);
		model.addAttribute("novel", novel);
		return "novel/novelDetail";
	}
	
	@GetMapping("/novelInsert")
	public String novelForm() {
		return "novel/novelForm";
	}
	
	@PostMapping("/novelInsert")
	public String novelInsert(NovelVO vo) {
		novelservice.insertNovel(vo);
		return "redirect:/novel/allList";
	}
	
	@PostMapping("/novelDelete")
	public String novelDelete(long novel_num) {
		novelservice.deleteNovel(novel_num);
		return "redirect:/novel/allList";
	}
	
	@PostMapping("/novelUpdateForm")
	public String updateForm(long novel_num, Model model) {
		NovelVO novel = novelservice.detailNovel(novel_num);
		model.addAttribute("novel", novel);
		return "novel/novelUpdateForm";
	}
	
	@PostMapping("/novelUpdate")
	public String novelUpdate(NovelVO vo) {
		novelservice.updateNovel(vo);
		
		return "redirect:/novel/novelDetail/" + vo.getNovel_num();
	}
	
		
		
}
