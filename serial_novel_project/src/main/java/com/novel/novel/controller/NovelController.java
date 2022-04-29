package com.novel.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.service.NovelService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/novel")
public class NovelController {
	
	
}
