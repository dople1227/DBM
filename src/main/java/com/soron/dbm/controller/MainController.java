package com.soron.dbm.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String index() {
		return "redirect:/dbm/tblList";
	}
	
	@GetMapping("/test")
	public String test(Model model) {
		model.addAttribute("model", model);
		return "test";
	}
}