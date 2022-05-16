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
	
	@GetMapping("/detail/{novel_num}/{paid_num}")
	public String getPaidDetail(@PathVariable long novel_num, @PathVariable long paid_num, Model model ) {
		PaidVO novel = paidservice.selectDetail(paid_num, novel_num);
		model.addAttribute("novel",novel);
		
		return "paid/paidDetail";
	}
	

}
