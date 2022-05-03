package com.novel.free.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.SearchCriteria;
import com.novel.free.service.FreeNovelService;

import lombok.extern.log4j.Log4j;

@Controller

@Service
@Log4j
@RequestMapping("/free")
public class FreeNovelController {
	
	@Autowired
	private FreeNovelService service;
	@GetMapping(value="all/{free_num}", 
			produces= {MediaType.APPLICATION_ATOM_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeNovelJoinVO>> list (SearchCriteria cri){
		ResponseEntity<List<FreeNovelJoinVO>> entity = null;
		try {
			entity = new ResponseEntity<>(
					service.getList(cri),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
			
	}
	

