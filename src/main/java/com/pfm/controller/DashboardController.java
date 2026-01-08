package com.pfm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DashboardController {

	@GetMapping("/dashboard")
	public String dashboardPage() {
		return "dashboard";
	}
	@GetMapping("/report")
	public String ReportPage() {
		return "report";
	}
	
	@GetMapping("/category")
	public String CategoryPage() {
		return "category";
	}
}
