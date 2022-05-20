package com.novel.freeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.freeboard.domain.Criteria;
import com.novel.freeboard.domain.FreeBoardVO;
import com.novel.freeboard.domain.PageMaker;
import com.novel.freeboard.domain.SearchCriteria;
import com.novel.freeboard.service.FreeBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;
	
	@GetMapping("/boardList")
	public String getboardList(SearchCriteria cri, Model model) {
		List<FreeBoardVO> boardList = service.getList(cri);
		model.addAttribute("boardList", boardList);
		
		// 버튼 처리를 위해 추가로 페이지메이커 생성 및 세팅
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int countPage = service.countPageNum(cri);// DB내 글 개수를 받아옴
		pageMaker.setTotalBoard(countPage); // calcData()호출도 되면서 순식간에 prev, next, stratPage, endPage세팅
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "/board/boardList";
	}
	
	@GetMapping("/boardDetail/{free_board_num}")
	public String getDetail(@PathVariable long free_board_num,Model model) {
		FreeBoardVO board = service.select(free_board_num);
		model.addAttribute("board",board);
		return "/board/boardDetail";
	}
	
	@GetMapping("/boardInsert")
	public String boardFormInsert() {
		return "/board/boardForm";
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(FreeBoardVO board) {
		service.insert(board);
		return "redirect:/board/boardList";
	}
	
	@PostMapping("/boardDelete")
	public String boardDelete(long free_board_num,SearchCriteria cri,RedirectAttributes rttr) {
		service.delete(free_board_num);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/board/boardList";
	}
	
	@PostMapping("/boardUpdateForm")
	public String updateForm(long free_board_num,Model model) {
		FreeBoardVO board = service.select(free_board_num);
		model.addAttribute("board",board);
		return "/board/boardUpdateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String update(FreeBoardVO board,SearchCriteria cri,RedirectAttributes rttr) {
		service.update(board);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/board/boardDetail/"+board.getFree_board_num();
	}
	
}
