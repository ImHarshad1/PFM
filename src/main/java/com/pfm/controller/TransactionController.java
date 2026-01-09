package com.pfm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TransactionController {
	
	@GetMapping("/addtransaction")
	public String addtransaction() {
		return "addtransaction";
	}
	
	@GetMapping("/transactions")
	public String transactionPage() {
		return "transactions";
	}
}
