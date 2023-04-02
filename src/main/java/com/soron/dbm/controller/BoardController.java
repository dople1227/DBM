package com.soron.dbm.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soron.dbm.dao.Board1DAO;
import com.soron.dbm.dto.Board1DTO;
import com.soron.dbm.dto.Criteria;
import com.soron.dbm.dto.PageDTO;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private Board1DAO board1DAO;
	
	 
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		int totCnt = board1DAO.selTotCnt(cri);
		model.addAttribute("selList",board1DAO.selList(cri));		
		model.addAttribute("pageMaker", new PageDTO(cri, totCnt));		
	}
	
	@GetMapping("/register")
	public void register() {				
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model ) {
		board1DAO.udtPostHits(no);
		model.addAttribute("selPostByNo",board1DAO.selPostByNo(no));
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute Board1DTO dto, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		dto.setIns_time(Timestamp.valueOf(LocalDateTime.now()));
		dto.setUdt_time(Timestamp.valueOf(LocalDateTime.now()));
		board1DAO.insPost(dto);
		
//		rttr.addFlashAttribute("result","success");
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute Board1DTO dto, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		dto.setUdt_time(Timestamp.valueOf(LocalDateTime.now()));
		board1DAO.udtPost(dto);
		
		rttr.addFlashAttribute("result","modified");
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("no") int no, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		board1DAO.delPost(no);
		rttr.addFlashAttribute("result","deleted");
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/board/list";
	}
}