package com.soron.dbm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.soron.dbm.dao.DbmDAO;
import com.soron.dbm.dto.Criteria;
import com.soron.dbm.dto.DbmColumnDTO;
import com.soron.dbm.dto.PageDTO;

@Controller

@RequestMapping("/dbm/*")
public class DbmController {
	@Autowired
	private DbmDAO dbmDAO;
	
	
	@GetMapping("/board")
	public String index() {
		return "redirect:/board/list";
	}

	@GetMapping("/tblList")
	public void list(Criteria cri, Model model) {
		int totCnt = dbmDAO.selTableTotCnt(cri);
		model.addAttribute("selTableList",dbmDAO.selTableList(cri));		
		model.addAttribute("pageMaker", new PageDTO(cri, totCnt));		
	}
	
	@GetMapping("/columnList")
	public void columnList(@RequestParam("table_name") String table_name, Criteria cri, Model model) {
		int totCnt = dbmDAO.selTableTotCnt(cri);
		model.addAttribute("tableName",table_name);
		model.addAttribute("selColumnList",dbmDAO.selColumnList(table_name));		
		model.addAttribute("pageMaker", new PageDTO(cri, totCnt));		
	}
	
	@ResponseBody
	@PostMapping("/columnModify")	
	private int modify(@RequestBody DbmColumnDTO dto, Model model) {
		int result = dbmDAO.alterColumn(dto);		
		model.addAttribute("result",result);
		return result;
	}
	
	@ExceptionHandler(Exception.class)
	public void exceptionHandler(Exception e) {
	    System.out.println(e.getMessage());
	}
	
//	@GetMapping({"/get", "/modify"}) 
//	public void get(@RequestParam("table_name") String table_name, @ModelAttribute("cri") Criteria cri, Model model ) {
//		model.addAttribute("selColumnList",dbmDAO.selColumnList(table_name)); 
//	}
	 
}