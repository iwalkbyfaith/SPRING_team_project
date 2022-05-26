package com.ict.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.novel.novel.domain.MainBestNovelVO;
import com.novel.novel.service.NovelService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private NovelService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		// ■■■■■■■■■■■■■■■■■■■■■■ ▲ 원래 있던 코드 ▲ ■■■■■■■■■■■■■■■■■■■■■■ 
		
		
		// ■ 무료 소설 조회수 베스트
		List<MainBestNovelVO> freeViewList = service.getBestViewFreeData();
		model.addAttribute("freeViewList", freeViewList);

		// ■ 무료 소설 추천수 베스트
		List<MainBestNovelVO> freeRecList = service.getBestRecFreeData();
		model.addAttribute("freeRecList", freeRecList);
		
		// ■ 유료 소설 조회수 베스트
		List<MainBestNovelVO> paidViewList = service.getBestViewPaidData();
		model.addAttribute("paidViewList", paidViewList);

		// ■ 유료 소설 추천수 베스트
		List<MainBestNovelVO> paidRecList = service.getBestRecPaidData();
		model.addAttribute("paidRecList", paidRecList);
		
		
		
		
		return "homeTest";
	}
	
	@GetMapping("/NewFile")
	public void NewFile() {
		
	}	
	
	@GetMapping("/homeTest2")
	public void test() {
		
	}
}
