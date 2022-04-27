package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ict.service.NovelService;

@RestController
@RequestMapping("/novel")
public class NovelController {
	
	@Autowired
	private NovelService service;
}
