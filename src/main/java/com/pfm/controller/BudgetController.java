package com.pfm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BudgetController {
	
	@GetMapping("/budget")
	public String addBudget() {
		return "budget";
	}
}
