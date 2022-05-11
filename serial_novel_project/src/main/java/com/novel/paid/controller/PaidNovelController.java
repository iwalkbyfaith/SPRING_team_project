package com.novel.paid.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.service.PaidNovelService;

@Controller
@RequestMapping("/paid")
public class PaidNovelController {
	
	@Autowired
	private PaidNovelService paidservice;
	
	@GetMapping(value="/List")
	public String getPaidList() {
		
		return "paid/paidList";
	}
	
	@GetMapping("/Insert")
	public String paidForm() {
		
		return "paid/paidForm";
	}
	
	@PostMapping("/Insert")
	public String paidInsert(PaidVO vo) {
		paidservice.insertPaid(vo);
		return "redirect:/paid/List";
	}
}
