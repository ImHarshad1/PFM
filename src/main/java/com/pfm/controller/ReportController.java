package com.pfm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReportController {

	@GetMapping("/report")
	public String ReportPage() {
		return "report";
	}
}
